class ConstValue {
  final String rupeeSymbol = "₹";
  final String checkSymbol = '✓';
  final int totalSignUpStep = 8;
  final String noInternet = "No Internet Connection";
  final String wentWrong = "something went wrong. Try again after some time";
}

class Session {
  final String id = 'id';
  final String authToken = 'authToken';
  final String emailId = 'emailId';
  final String password = 'password';
  final String phone = 'phone';
  final String isoCode = 'isoCode';
  //for language change
  final String languageCode = 'languageCode';
  final String countryCode = 'countryCode';
}

class ApiType {
  final String get = "get";
  final String post = 'post';
  final String put = 'put';
  final String delete = 'delet';
}
