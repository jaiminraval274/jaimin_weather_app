/**
 * Created by Jaimin on 21/03/24.
 */


import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var box = GetStorage();
  late Position location;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
// @override
// void onInit() {
//   login();
//   super.onInit();
// }
//
// void login() async {
//   var body = {
//     'email': 'user@gmail.com',
//     'password': '12345678',
//   };
//   var response =
//       await ApiServices.ApiProvider(1, url: currentEndPoint, body: body);
//   try {
//     var data = json.decode(response);
//     Console.Log('weatherResponse', data);
//   } catch (e) {
//     Console.Log('getWeatherData', e);
//   }
// }
