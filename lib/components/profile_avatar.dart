import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/utils/color_luminance.dart';

enum ProfileAvatarSize { extraSmall, small, medium, big }

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar({
    super.key,
    this.backgroundColor = AppColorPalette.secondaryColor,
    Color? foregroundColor,
    this.foregroundImage,
    this.backgroundImage,
    ProfileAvatarSize? size,
    double? radius,
    double? iconSize,
    this.child = const Icon(Icons.add_a_photo),
  })  : assert(!(radius != null && size != null)),
        foregroundColor = foregroundColor ??
            getForegroundColorForBackground(
                backgroundColor, Colors.white, AppColorPalette.primaryColor),
        size = size ?? ProfileAvatarSize.medium,
        _radius = radius,
        _iconSize = iconSize;

  final Color backgroundColor;
  final Color foregroundColor;
  final ImageProvider<Object>? foregroundImage;
  final ImageProvider<Object>? backgroundImage;
  final ProfileAvatarSize size;
  final double? _radius;
  final double? _iconSize;
  final Widget child;

  double get radius {
    final radius = _radius;
    if (radius != null) return radius;
    switch (size) {
      case ProfileAvatarSize.extraSmall:
        return 16;
      case ProfileAvatarSize.small:
        return 24;
      case ProfileAvatarSize.big:
        return 128;
      case ProfileAvatarSize.medium:
      default:
        return 64;
    }
  }

  double get iconSize {
    final iconSize = _iconSize;
    if (iconSize != null) return iconSize;
    return (radius / 1.333).roundToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: foregroundImage,
      backgroundImage: backgroundImage,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      child: IconTheme(
        data: IconThemeData(color: foregroundColor, size: iconSize),
        child: child,
      ),
    );
  }
}
