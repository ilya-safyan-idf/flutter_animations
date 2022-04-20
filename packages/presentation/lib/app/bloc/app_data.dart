import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screens/main/main_screen.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([MainScreen.page()]);
    return AppData(pages);
  }
}
