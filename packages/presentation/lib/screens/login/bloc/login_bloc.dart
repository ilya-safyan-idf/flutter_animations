import 'package:presentation/base/bloc/bloc.dart';
import 'package:presentation/base/bloc/bloc_impl.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/screens/login/bloc/login_data.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/screens/test/test.dart';

enum TypeOfInput { password, login }

@injectable
abstract class LoginBloc extends Bloc {
  @factoryMethod
  factory LoginBloc() => _LoginBlocImpl();

  void updateLoadingStatus({required bool loading});
  void onChange({required String inputValue, required TypeOfInput inputType});
  void updateState();
  void onLogin();
  void moveToTestScreen();
}

class _LoginBlocImpl extends BlocImpl implements LoginBloc {
  final LoginData _state = LoginData.init();

  _LoginBlocImpl();

  @override
  void initState() {
    super.initState();
    updateState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void updateState() {
    super.handleData(
      isLoading: super.loadingStatus,
      data: _state,
    );
  }

  @override
  void updateLoadingStatus({required bool loading}) {
    super.updateLoadingStatus(loading: loading);
  }

  @override
  void onChange({required String inputValue, required TypeOfInput inputType}) {
    switch (inputType) {
      case TypeOfInput.password:
        _state.passwordValue = inputValue;
        break;
      case TypeOfInput.login:
        _state.loginValue = inputValue;
        break;
    }

    updateState();
  }

  @override
  void onLogin() {
    moveToTestScreen();
    print(_state.loginValue);
    print(_state.passwordValue);
  }

  @override
  void moveToTestScreen() {
    appNavigator.push(
      Test.page(arguments: {'test': 123} as BaseArguments),
    );
  }
}
