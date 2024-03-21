/**
 * Created by Jaimin on 21/03/24.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaimin_weather_app/Utils/Extentions.dart';
import 'package:jaimin_weather_app/routes/app_pages.dart';

import '../../../Utils/ConsoleLog.dart';
import '../../../Utils/CustomWidget.dart';
import '../../../Utils/Height_Width.dart';
import '../../../Utils/Strings.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  var controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 6,
          ),
          Image.asset(weatherIcon).center(),
          const Spacer(),
          CommonText(
            text: 'Weather',
            fontSize: 45,
          ),
          CommonText(
            text: 'Forecast',
            fontSize: 45,
            textColor: Colors.indigo,
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: CustomButton(
              text: 'Get Started',
              textColor: Colors.white,
              color: Colors.indigo,
              onTap: () async {
                controller.location = await controller.determinePosition();
                controller.box.write(lat, controller.location.latitude);
                controller.box.write(long, controller.location.longitude);
                Console.Log('Location',
                    '${controller.location.latitude} : ${controller.location.longitude}');
                Get.offAllNamed(Routes.HOME);
              },
            ),
          ),
          SizedBox(
            height: Get.height / 9,
          ),
        ],
      ),
    );
  }
}
