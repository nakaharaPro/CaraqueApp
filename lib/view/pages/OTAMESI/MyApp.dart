import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: NeonButton(),
        ),
      ),
    );
  }
}

class NeonButton extends StatefulWidget {
  @override
  _NeonButtonState createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin:const  Color.fromARGB(255, 253, 0, 0),//縁の色
      end: Colors.black,//縁の色
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39),
            border: Border.all(
              color: _colorAnimation.value!,
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: _colorAnimation.value!.withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),

          //ここは普通のボタン
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(39),
              ), backgroundColor: Colors.blue,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            child: Text(
              'Button',
              style: TextStyle(
                fontSize: 24,
                color: Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}
