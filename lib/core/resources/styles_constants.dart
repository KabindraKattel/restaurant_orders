import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/resources/spacing_constants.dart';

class StylesConstants {
  static const double kLoginFormWidth = 300;

  ///GridView
  static const double kGridViewCrossAxisSpacing = SpacingConstants.kS8;
  static const double kGridViewMainAxisSpacing = SpacingConstants.kS8;
  static const double kGridViewAspectRatio = SpacingConstants.kS1;

  ///Content
  static const double kHeadingSize = SpacingConstants.kS18;
  static const double kTitleSize = SpacingConstants.kS16;
  static const double kSubTitleSize = SpacingConstants.kS14;
  static const double kCaptionSize = SpacingConstants.kS10;

  static const FontWeight kHeadingWeight = FontWeight.bold;
  static const FontWeight kTitleWeight = FontWeight.w700;
  static const FontWeight kSubTitleWeight = FontWeight.w500;
  static const FontWeight kCaptionWeight = FontWeight.w300;

  ///Dialog
  static const ShapeBorder kDialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(RadiusConstants.kR16),
  );

  ///Card
  static const ShapeBorder kCardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(RadiusConstants.kR8),
  );
  static const ShapeBorder kCardCaptionShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: RadiusConstants.kR8,
      bottomRight: RadiusConstants.kR8,
    ),
  );

  static const ShapeBorder kCardTitleShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: RadiusConstants.kR8,
      topRight: RadiusConstants.kR8,
    ),
  );
}
