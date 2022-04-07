import 'package:flutter/material.dart';
import 'package:presentation/base/bloc/bloc_data.dart';
import 'package:presentation/base/bloc/bloc_state.dart';
import 'package:presentation/navigator/app_page.dart';
import 'package:presentation/navigator/base_arguments.dart';

import 'package:presentation/screens/login/bloc/login_bloc.dart';
import 'package:presentation/screens/login/bloc/login_data.dart';
import 'package:presentation/utils/helpers/positioning.dart';

class LoginScreen extends StatefulWidget {
  static const ROUTE_NAME = '/Login';

  const LoginScreen({Key? key}) : super(key: key);

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(ROUTE_NAME),
        name: ROUTE_NAME,
        arguments: arguments,
        builder: (context) => LoginScreen(),
      );

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends BlocState<LoginScreen, LoginBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<BlocData>(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            final BlocData? blocData = snapshot.data;
            final bool? screenLoadStatus = blocData?.isLoading;
            final LoginData? screenData = blocData?.data;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => bloc.onChange(
                      inputValue: value,
                      inputType: TypeOfInput.login,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: screenData is LoginData
                          ? screenData.verifyLoginStatus
                          : null,
                    ),
                  ),
                  addVerticalSpace(20),
                  TextField(
                    onChanged: (value) => bloc.onChange(
                        inputValue: value, inputType: TypeOfInput.password),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: screenData is LoginData
                          ? screenData.verifyPasswordStatus
                          : null,
                    ),
                  ),
                  addExpandedSpace(),
                  screenLoadStatus is bool && screenLoadStatus == true
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          child: const Text('Login'),
                          onPressed: bloc.onLogin,
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
