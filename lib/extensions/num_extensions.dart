import 'package:flutter/material.dart';

extension NumExtensions on num? {
  double get validate => this as double? ?? 0.0;

  EdgeInsets get edgeInsetsHorizontal => EdgeInsets.symmetric(horizontal: validate);

  EdgeInsets get edgeInsetsVertical => EdgeInsets.symmetric(vertical: validate);

  EdgeInsets get edgeInsetsAll => EdgeInsets.all(validate);

  EdgeInsets get edgeInsetsOnlyTop => EdgeInsets.only(top: validate);

  EdgeInsets get edgeInsetsOnlyBottom => EdgeInsets.only(bottom: validate);

  EdgeInsets get edgeInsetsOnlyLeft => EdgeInsets.only(left: validate);

  EdgeInsets get edgeInsetsOnlyRight => EdgeInsets.only(right: validate);

  BorderRadius get borderRadius => BorderRadius.circular(validate);

  BorderRadius get leftBorderRadius => BorderRadius.only(
        topLeft: Radius.circular(validate),
        bottomLeft: Radius.circular(validate),
      );

  BorderRadius get rightBorderRadius => BorderRadius.only(
        topRight: Radius.circular(validate),
        bottomRight: Radius.circular(validate),
      );

  BorderRadius get topBorderRadius => BorderRadius.only(
        topLeft: Radius.circular(validate),
        topRight: Radius.circular(validate),
      );

  BorderRadius get bottomBorderRadius => BorderRadius.only(
        bottomLeft: Radius.circular(validate),
        bottomRight: Radius.circular(validate),
      );
}
