
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/firebase_db_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MailAddPage extends StatelessWidget {
  const MailAddPage({Key? key}) : super(key: key);
   static const path = "/mail_add"; //パス



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MemberInfoAddScreen(),
    );
  }
}

class MemberInfoAddScreen extends StatefulWidget {
  const MemberInfoAddScreen({Key? key}) : super(key: key);
  


  @override
  State<MemberInfoAddScreen> createState() => _MailScreenState();

  
}

class _MailScreenState extends State<MemberInfoAddScreen> {
  //コントローラー値
  final memberController = FirebaseDbController.to;
  final authControllerEmail = AuthController.to.rxAuthUser.value!.email as String;
 

  late TextEditingController _emailController;
  late TextEditingController _bodyController;
  late TextEditingController _subjectController;
  late TextEditingController _bccController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _bodyController = TextEditingController();
    _subjectController = TextEditingController();
    _bccController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _bodyController.dispose();
    _subjectController.dispose();
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
                controller: _subjectController,
                decoration: InputDecoration(hintText: '件名'),
              ),
      
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _sendEmail, child: Text('メールを送信する')),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendEmail() async {
  String name = memberController.publicUserInfo!['nameFull'] as String;//フルネーム
  String message = orderMailConst(name);//本文
  
    final email = Email(
      body: orderMailConst(name),
      subject: _subjectController.text,
      recipients: [_emailController.text],
      cc: [authControllerEmail],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
  

  
  static String orderMailConst(String name) {
      return '''
$name様

ご注文の確認をお願いいたします。
''';

  }
  
}