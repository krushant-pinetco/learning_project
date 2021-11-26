import 'server_config.dart';

ServerConfig _config = ServerConfig();

class ApiMethods {
  String signUp(code) => "${_config.apiVersion}/register/$code";
}
