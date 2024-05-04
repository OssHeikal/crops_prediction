import 'dart:ui';

import 'package:crops_prediction/extensions/context_extension.dart';
import 'package:crops_prediction/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding Directional
  Padding paddingStart(double start) {
    return Padding(padding: EdgeInsetsDirectional.only(start: start), child: this);
  }

  Padding paddingEnd(double end) {
    return Padding(padding: EdgeInsetsDirectional.only(end: end), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return padding Symmetric
  Padding paddingSymmetric(double horizontal, double vertical) {
    return Padding(padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal), child: this);
  }

  Padding paddingVertical(double padding) {
    return Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);
  }

  Padding paddingHorizontal(double padding) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({double top = 0.0, double left = 0.0, double bottom = 0.0, double right = 0.0}) {
    return Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddingDirectionalOnly({double top = 0.0, double start = 0.0, double bottom = 0.0, double end = 0.0}) {
    return Padding(padding: EdgeInsetsDirectional.only(top: top, bottom: bottom, start: start, end: end), child: this);
  }

  Padding paddingDirectionalAll({double padding = 0}) {
    return Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  }
}

extension WidgetExtension on Widget {
  Container setContainerToView({
    double? height,
    double? width,
    double? margin,
    double? padding,
    double? radius,
    Color? color,
    Color? borderColor,
    AlignmentGeometry? alignment,
    List<BoxShadow>? shadows,
    double borderWidth = 1,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: EdgeInsets.all(margin ?? 0),
      padding: EdgeInsets.all(padding ?? 0.r),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
          side: borderColor != null ? BorderSide(color: borderColor, width: borderWidth.r) : BorderSide.none,
        ),
        shadows: shadows,
      ),
      child: this,
    );
  }

  ClipRRect withGlassEffect({
    double? height,
    double? width,
    Color? color,
    bool hasBorder = true,
    double radius = 16,
    double padding = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: height ?? 60.h,
          width: width,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(radius.r),
            border: hasBorder ? Border.all(color: color ?? Colors.white.withOpacity(0.6), width: 1.w) : null,
          ),
          child: this,
        ),
      ),
    );
  }

  Widget setTitle(
    BuildContext context, {
    String? title,
    Widget? titleIcon,
    double? fontSize,
    TextStyle? titleStyle,
    double gap = 8,
    double titlePadding = 0,
  }) {
    return title != null
        ? Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(title, style: titleStyle ?? context.titleLarge!.bold.s16).paddingHorizontal(titlePadding),
              titleIcon ?? const SizedBox.shrink()
            ]),
            gap.h.verticalSpace,
            this
          ])
        : this;
  }

  // Widget setSvgToView({
  //   required String svgPath,
  //   Color? color,
  //   double size = 24,
  //   double gap = 8,
  //   bool isEnd = false,
  // }) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       if (isEnd) this,
  //       if (isEnd) gap.w.horizontalSpace,
  //       svgPath.toSvg(color: color, height: size, width: size),
  //       if (!isEnd) gap.w.horizontalSpace,
  //       if (!isEnd) this,
  //     ],
  //   );
  // }

  Widget setIconToView({
    required IconData icon,
    Color? color,
    double size = 24,
    double gap = 8,
    bool isEnd = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isEnd) this,
        if (isEnd) gap.w.horizontalSpace,
        Icon(icon, color: color, size: size),
        if (!isEnd) gap.w.horizontalSpace,
        if (!isEnd) this,
      ],
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this : (defaultWidget ?? const SizedBox());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectTop(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectBottom(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRectOnlyWithBorder({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
    Color? borderColor,
    double borderWidth = 1,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth),
        ),
        child: this,
      ),
    );
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this);
  }

  /// add tap to parent widget
  Widget onTap(
    Function? function, {
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      borderRadius: borderRadius,
      child: this,
    );
  }
}
