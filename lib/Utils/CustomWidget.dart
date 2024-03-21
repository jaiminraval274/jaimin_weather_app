/**
 * Created by Jaimin on 21/03/24.
 */


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bounce_widget.dart';

OutlineInputBorder? commonBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Colors.grey),
);

class CommonText extends StatelessWidget {
  String? text;
  Color? textColor;
  double? fontSize;
  int? maxLine;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  bool? softWrap;

  CommonText({
    super.key,
    this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.maxLine,
    this.textOverflow,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: softWrap,
    );
  }
}

class CustomButton extends StatelessWidget {
  String? text;
  Function()? onTap;
  Color? color, textColor;
  double? height;

  CustomButton({
    super.key,
    this.text,
    this.onTap,
    this.height = 55,
    this.color = Colors.indigo,
    this.textColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: onTap,
      child: Container(
        height: height,
        width: Get.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: CommonText(
          text: text!,
          textColor: textColor,
        ),
      ),
    );
  }
}
