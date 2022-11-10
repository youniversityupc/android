import 'package:flutter/material.dart';

/// Evaluates the brightness of a color and returns `Brightness.light` or
/// `Brightness.dark` accordingly.
///
/// The luminance threshold used (`0.179`) is based on the W3C guidelines.
///
/// See <https://stackoverflow.com/a/3943023/15040387>.
Brightness getBrightnessForBackground(Color background) {
  final luminance = background.computeLuminance();
  return (luminance > 0.179) ? Brightness.light : Brightness.dark;
}

/// Returns `light` if a darker color should be used with `bg` as background.
/// Returns `dark` otherwise.
Color getForegroundColorForBackground(Color bg, Color light, Color dark) {
  final brightness = getBrightnessForBackground(bg);
  if (brightness == Brightness.light) return dark;
  return light;
}
