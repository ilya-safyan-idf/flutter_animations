class MainData {
  String? verifyLoginStatus;
  String? verifyPasswordStatus;
  String passwordValue;
  String loginValue;

  MainData({
    this.verifyLoginStatus,
    this.verifyPasswordStatus,
    required this.passwordValue,
    required this.loginValue,
  });

  factory MainData.init() => MainData(
        verifyLoginStatus: null,
        verifyPasswordStatus: null,
        passwordValue: '',
        loginValue: '',
      );

  MainData copyWith() => MainData(
        verifyLoginStatus: verifyLoginStatus,
        verifyPasswordStatus: verifyPasswordStatus,
        passwordValue: passwordValue,
        loginValue: loginValue,
      );
}
