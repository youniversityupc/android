import 'package:flutter/material.dart';

extension WidgetListExtensions on List<Widget> {
  List<Widget> withVerticalSpace(double height) =>
      withSpaceBetween(height: height);

  List<Widget> withHorizontalSpace(double width) =>
      withSpaceBetween(width: width);

  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}
