import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screens/login/login_screen.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([LoginScreen.page()]);
    return AppData(pages);
  }
}
