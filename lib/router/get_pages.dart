//画面リンクパス一覧
import 'package:caraqueprod/view/pages/account_page.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/order_screen_check/login_check_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/verify_email_screen.dart';
import 'package:get/get.dart';

class GetPages {
  static final List<GetPage> value = [
    GetPage(name: AccountPage.path, page: () => const AccountPage()),
    GetPage(name: MainScreen.path, page: () => const MainScreen()),
    GetPage(name:VerifyEmailScreen.path, page: () => const VerifyEmailScreen()),
    GetPage(name:SignupScreen.path, page:() => const SignupScreen()),
    GetPage(name:LoginScreen.path, page:() => const LoginScreen()),
    GetPage(name:LoginCheckScreen.path, page:() => const LoginCheckScreen()),



  ];
}