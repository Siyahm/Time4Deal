class SignUpModelForToken {
  String? accessToken;
  String? refreshToken;

  SignUpModelForToken({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignUpModelForToken.fromJson(Map<String, dynamic> json) {
    return SignUpModelForToken(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
