/**
 * Created by Jaimin on 21/03/24.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaimin_weather_app/Utils/CustomWidget.dart';
import 'package:jaimin_weather_app/Utils/Extentions.dart';
import 'package:jaimin_weather_app/Utils/Height_Width.dart';
import 'package:jaimin_weather_app/Utils/Strings.dart';
import 'package:jaimin_weather_app/Utils/bounce_widget.dart';

import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => homeController.isSearch.value == true
              ? TextFormField(
                  controller: homeController.searchController,
                  style: TextStyle(
                    color: homeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                  ),
                  focusNode: FocusNode(),
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    homeController.getWeatherData(
                        isSearch: true, isRefresh: false);
                    homeController.searchController.clear();
                    homeController.isSearch.value = false;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      color: homeController.isDarkMode.value
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                )
              : CommonText(
                  text: homeController.currentLocation.value.name ?? '',
                  fontSize: 35,
                ),
        ),
        actions: [
          Bouncing(
            child: Obx(
              () => Icon(
                homeController.isSearch.value
                    ? Icons.cancel_outlined
                    : Icons.search,
                size: 30,
              ),
            ),
            onPress: () {
              homeController.isSearch.value = !homeController.isSearch.value;
              homeController.searchController.clear();
            },
          ),
          width15,
          Obx(
            () => Bouncing(
              child: Image.asset(
                theme,
                height: 36,
                color: homeController.isDarkMode.value
                    ? Colors.black
                    : Colors.white,
                width: 36,
              ),
              onPress: () {
                homeController.isDarkMode.value =
                    !homeController.isDarkMode.value;
                if (homeController.isDarkMode.value == true) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
            ),
          ),
          width15,
        ],
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? const CircularProgressIndicator().center()
            : RefreshIndicator(
                onRefresh: () => homeController.getWeatherData(
                    isRefresh: true, isSearch: false),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          height50,
                          CommonText(
                            text: homeController.currentWeather.value.tempC
                                .round()
                                .toString(),
                            fontSize: 70,
                          ),
                          CommonText(
                            text: homeController
                                    .currentWeather.value.condition!.text ??
                                '',
                            fontSize: 30,
                          ),
                          height30,
                          Container(
                            width: Get.width,
                            height: Get.height / 3,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              //horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(2, 1),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          wind,
                                          height: 55,
                                          width: 55,
                                        ),
                                        height10,
                                        CommonText(
                                          text: 'Wind',
                                          textColor: Colors.black,
                                        ),
                                        height5,
                                        CommonText(
                                          text:
                                              '${homeController.currentWeather.value.windKph.toString()} k/h',
                                          textColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          humidity,
                                          height: 55,
                                          width: 55,
                                        ),
                                        height10,
                                        CommonText(
                                          text: 'Humidity',
                                          textColor: Colors.black,
                                        ),
                                        height5,
                                        CommonText(
                                          text:
                                              '${homeController.currentWeather.value.humidity.toString()}%',
                                          textColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                height20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          pressure,
                                          height: 55,
                                          width: 55,
                                        ),
                                        height10,
                                        CommonText(
                                          text: 'Pressure',
                                          textColor: Colors.black,
                                        ),
                                        height5,
                                        CommonText(
                                          text:
                                              '${homeController.currentWeather.value.pressureMb.round().toString()} hPo',
                                          textColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          uv,
                                          height: 55,
                                          width: 55,
                                        ),
                                        height10,
                                        CommonText(
                                          text: 'Uv',
                                          textColor: Colors.black,
                                        ),
                                        height5,
                                        CommonText(
                                          text:
                                              '${homeController.currentWeather.value.humidity.toString()}%',
                                          textColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          height40,
                          SizedBox(
                            key: UniqueKey(),
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.forecast.value
                                    .forecastday![0].hour!.length,
                                itemBuilder: (context, index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  height: Get.height,
                                  decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.circular(27),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(2, 1),
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      height20,
                                      CommonText(
                                        text: homeController.formatter.format(
                                          DateTime.parse(homeController
                                              .forecast
                                              .value
                                              .forecastday![0]
                                              .hour![index]
                                              .time),
                                        ),
                                        textColor: Colors.white,
                                      ),
                                      Image.asset(
                                        'assets/icon/day/122.png',
                                        scale: 2,
                                      ),
                                      CommonText(
                                        text:
                                            '${homeController.forecast.value.forecastday![0].hour![index].tempC.round().toString()} c',
                                        textColor: Colors.white,
                                      ),
                                      height5,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: Get.width / 3.5,
                        top: 40,
                        child: CommonText(
                          text: '°c',
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
