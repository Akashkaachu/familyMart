class UserModel {
  final String? firstname;
  final String? lastname;
  final String? phoneNumber;
  final String? emailId;
  final String? password;

  UserModel(
      {this.firstname,
      this.lastname,
      this.phoneNumber,
      this.emailId,
      this.password});
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'phone': phoneNumber,
      'email': emailId,
      'password': password,
      "referral_code": "string"
    };
  }
}
