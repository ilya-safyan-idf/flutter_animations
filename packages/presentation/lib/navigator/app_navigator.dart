import 'base_page.dart';

abstract class AppNavigator {
  void init({
    Function(BasePage page) push,
    Function(BasePage page) popOldAndPush,
    Function(BasePage page) popAllAndPush,
    Function(List<BasePage> pages) pushPages,
    Function(BasePage page) popAndPush,
    Function(List<BasePage> pages) popAllAndPushPages,
    Function() pop,
    Function() maybePop,
    Function(BasePage page) popUntil,
    BasePage? Function() currentPage,
  });

  void push(BasePage page);

  void popAllAndPush(BasePage page);

  void popOldAndPush(BasePage page);

  void pushPages(List<BasePage> pages);

  void popAndPush(BasePage page);

  void popAllAndPushPages(List<BasePage> pages);

  void pop();

  void maybePop();

  void popUntil(BasePage page);

  BasePage? currentPage();
}
