import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image Slideshow with Fade')),
        body: ImageSlideshow(),
      ),
    );
  }
}

class ImageSlideshow extends StatefulWidget {
  @override
  _ImageSlideshowState createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<String> _images = [
    'assets/images/caraque1.jpg',
    'assets/images/caraque2.jpg',
    'assets/images/caraque3.jpg', // Add more images here
  ];
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _startImageSlideshow();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startImageSlideshow() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _controller.reverse().then((_) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _images.length;
        });
        _controller.forward();
      });
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
          width: 200,
          height: 200,
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              _images[_currentIndex],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
