/**
 * Created by Jaimin on 21/03/24.
 */


import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Home/bindings/home_bindings.dart';
import '../Screens/Home/view/home_view.dart';
import '../Screens/Splash/binding/splash_bindings.dart';
import '../Screens/Splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [

    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
