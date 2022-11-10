import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youniversity_app/utils/color_luminance.dart';

void main() {
  group('Color luminance', () {
    group('getBrightnessForBackground', () {
      test('Lighter color should return `Brightness.light`', () {
        final brightness = getBrightnessForBackground(Colors.white);
        expect(brightness, Brightness.light);
      });

      test('Darker color should return `Brightness.dark`', () {
        final brightness = getBrightnessForBackground(Colors.black);
        expect(brightness, Brightness.dark);
      });
    });

    group('getForegroundColorForBackground', () {
      const light = Colors.cyan;
      const dark = Colors.black54;

      test('Should return the light color when the background is dark', () {
        const bg = Colors.black;
        final color = getForegroundColorForBackground(bg, light, dark);
        expect(color, light);
      });

      test('Should return the dark color when the background is light', () {
        const bg = Colors.white;
        final color = getForegroundColorForBackground(bg, light, dark);
        expect(color, dark);
      });
    });
  });
}
