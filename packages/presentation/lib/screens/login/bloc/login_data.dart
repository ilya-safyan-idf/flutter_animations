class LoginData {
  String? verifyLoginStatus;
  String? verifyPasswordStatus;
  String passwordValue;
  String loginValue;

  LoginData({
    this.verifyLoginStatus,
    this.verifyPasswordStatus,
    required this.passwordValue,
    required this.loginValue,
  });

  factory LoginData.init() => LoginData(
        verifyLoginStatus: null,
        verifyPasswordStatus: null,
        passwordValue: '',
        loginValue: '',
      );

  LoginData copyWith() => LoginData(
        verifyLoginStatus: verifyLoginStatus,
        verifyPasswordStatus: verifyPasswordStatus,
        passwordValue: passwordValue,
        loginValue: loginValue,
      );
}
