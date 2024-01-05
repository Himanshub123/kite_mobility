class SignInParam {
  String customerEmail = "";
  String password = "";
  String deviceType = "";
  String deviceToken = "";
  String appVersion = "";
  int lang = 0;

  SignInParam(this.customerEmail, this.password, this.deviceType,
      this.deviceToken, this.appVersion);

  Map<String, dynamic> toJson() {
    return {
      'customer_email': customerEmail,
      'password': password,
      'device_type': deviceType,
      'device_token': deviceToken,
      'app_version': appVersion,
      'lang': lang
    };
  }
}
