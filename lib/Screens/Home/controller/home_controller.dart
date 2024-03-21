/**
 * Created by Jaimin on 21/03/24.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../ApiManager/ApiServices.dart';
import '../../../Model/WeatherModel.dart';
import '../../../Utils/ConsoleLog.dart';
import '../../../Utils/Strings.dart';

class HomeController extends GetxController {
  var box = GetStorage();
  var currentWeather = Current().obs,
      currentLocation = Location().obs,
      forecast = Forecast().obs;
  var latValue = 0.0.obs, longValue = 0.0.obs;
  var isLoading = true.obs, isDarkMode = false.obs;
  final DateFormat formatter = DateFormat('HH:mm');
  var searchController = TextEditingController(), isSearch = false.obs;

  @override
  void onReady() {
    getWeatherData(isRefresh: false, isSearch: false);
    Console.Log('Current Theme', Theme.of(Get.context!).brightness);
    isDarkMode.value =
        Theme.of(Get.context!).brightness == ThemeMode.dark ? true : false;
    super.onReady();
  }

  Future<void> getWeatherData({bool? isRefresh, bool? isSearch}) async {
    if (!isRefresh!) {
      isLoading.value = true;
    }
    latValue.value = box.read(lat);
    longValue.value = box.read(long);
    var body = {
      'key': APIKEY,
      'q': isSearch!
          ? searchController.text
          : '${latValue.value},${longValue.value}'
    };
    var response =
        await ApiServices.ApiProvider(1, url: currentEndPoint, body: body);
    try {
      var data = weatherModelFromJson(response);
      currentWeather.value = data.current!;
      currentLocation.value = data.location!;
      forecast.value = data.forecast!;
      Console.Log('weatherResponse', data.location!.name!);
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      Console.Log('getWeatherData', e);
    }
  }

  void getUsers() async {
    var response = await ApiServices.ApiProvider(1, url: currentEndPoint);
    try {
      var data = weatherModelFromJson(response);
      currentWeather.value = data.current!;
      currentLocation.value = data.location!;
      forecast.value = data.forecast!;
      Console.Log('weatherResponse', data.location!.name!);
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      Console.Log('getWeatherData', e);
    }
  }

  void getAlbums() {}

  void getPhotos() {}
}
