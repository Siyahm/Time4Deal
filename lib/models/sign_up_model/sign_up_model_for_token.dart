class SignUpModelForToken {
  String? accessToken;
  String? refreshToken;

  SignUpModelForToken({
    this.accessToken,
    this.refreshToken,
  });

  factory SignUpModelForToken.fromJson(Map<String, dynamic> json) {
    return SignUpModelForToken(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
