import 'package:get/get.dart';
import 'package:learning_project/global/packages/screen_package.dart';

//app file
import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.home, page: () => HomeScreen()),
    GetPage(name: _routeName.noInternet, page: () => NoInternet()),
  ];
}
