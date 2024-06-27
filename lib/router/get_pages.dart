 
import 'package:caraqueprod/view/pages/account_page.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:get/get.dart';

class GetPages {
  static final List<GetPage> value = [
    GetPage(name: AccountPage.path, page: () => const AccountPage()),
    GetPage(name: LoginScreen.path, page: () => const LoginScreen()),
  ];
}