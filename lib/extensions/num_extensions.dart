import 'package:flutter/material.dart';

extension NumExtensions on num? {
  num get validateNum => this ?? 0;

  double get validateDouble => validateNum.toDouble();

  EdgeInsets get edgeInsetsHorizontal => EdgeInsets.symmetric(horizontal: validateDouble);

  EdgeInsets get edgeInsetsVertical => EdgeInsets.symmetric(vertical: validateDouble);

  EdgeInsets get edgeInsetsAll => EdgeInsets.all(validateDouble);

  EdgeInsets get edgeInsetsOnlyTop => EdgeInsets.only(top: validateDouble);

  EdgeInsets get edgeInsetsOnlyBottom => EdgeInsets.only(bottom: validateDouble);

  EdgeInsets get edgeInsetsOnlyLeft => EdgeInsets.only(left: validateDouble);

  EdgeInsets get edgeInsetsOnlyRight => EdgeInsets.only(right: validateDouble);

  BorderRadius get borderRadius => BorderRadius.circular(validateDouble);

  BorderRadius get leftBorderRadius => BorderRadius.only(
        topLeft: Radius.circular(validateDouble),
        bottomLeft: Radius.circular(validateDouble),
      );

  BorderRadius get rightBorderRadius => BorderRadius.only(
        topRight: Radius.circular(validateDouble),
        bottomRight: Radius.circular(validateDouble),
      );

  BorderRadius get topBorderRadius => BorderRadius.only(
        topLeft: Radius.circular(validateDouble),
        topRight: Radius.circular(validateDouble),
      );

  BorderRadius get bottomBorderRadius => BorderRadius.only(
        bottomLeft: Radius.circular(validateDouble),
        bottomRight: Radius.circular(validateDouble),
      );
}
