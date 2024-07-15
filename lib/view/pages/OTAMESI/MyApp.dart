
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MailApp extends StatelessWidget {
  const MailApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MailScreen(),
    );
  }
}

class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  late TextEditingController _emailController;
  late TextEditingController _bodyController;
  late TextEditingController _subjectController;
  late TextEditingController _ccController;
  late TextEditingController _bccController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _bodyController = TextEditingController();
    _subjectController = TextEditingController();
    _ccController = TextEditingController();
    _bccController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _bodyController.dispose();
    _subjectController.dispose();
    _ccController.dispose();
    _bccController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('メール送信')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: '宛先'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _ccController,
                decoration: InputDecoration(hintText: 'cc'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _bccController,
                decoration: InputDecoration(hintText: 'bcc'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(hintText: '件名'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(hintText: '本文'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _sendEmail, child: Text('送信する')),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendEmail() async {
    final email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_emailController.text],
      cc: [_ccController.text],
      bcc: [_bccController.text],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
}