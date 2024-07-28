//画面リンクパス一覧
import 'package:caraqueprod/view/pages/my_home_page/error_page.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/input_info.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/member_info_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/verify_email_screen.dart';
import 'package:get/get.dart';

class GetPages {
  static final List<GetPage> value = [
    GetPage(name: MainScreen.path, page: () => const MainScreen()),
    GetPage(name:VerifyEmailScreen.path, page: () => const VerifyEmailScreen()),
    GetPage(name:SignupScreen.path, page:() => const SignupScreen()),
    GetPage(name:LoginScreen.path, page:() => const LoginScreen()),
    GetPage(name:MemberInfoScreen.path, page:() => const MemberInfoScreen()),
    GetPage(name:InputInfo.path, page:() => const InputInfo()),
    GetPage(name:ErrorPage.path, page:() => const ErrorPage()),





  ];
}