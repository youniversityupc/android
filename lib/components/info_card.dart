import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/color_luminance.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class InfoCardItem extends StatelessWidget {
  const InfoCardItem({
    super.key,
    this.leading,
    required this.child,
    this.trailing,
    this.horizontalGap = 8.0,
  });

  final Widget? leading;
  final Widget child;
  final Widget? trailing;
  final double horizontalGap;

  @override
  Widget build(BuildContext context) {
    final leading = this.leading;
    final trailing = this.trailing;

    return Row(
      children: [
        if (leading != null) leading,
        SizedBox(width: horizontalGap),
        child,
        const Spacer(),
        if (trailing != null) trailing,
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({
    super.key,
    this.backgroundColor = AppColorPalette.primaryColor,
    Color? foregroundColor,
    this.clipBehavior,
    this.contentAlignment = CrossAxisAlignment.start,
    this.title,
    this.titleVerticalGap = 8.0,
    this.contentVerticalGap = 8.0,
    this.children = const [],
  }) : foregroundColor = foregroundColor ??
            getForegroundColorForBackground(
                backgroundColor, Colors.white, AppColorPalette.gray900);

  final Color backgroundColor;
  final Color foregroundColor;
  final Clip? clipBehavior;
  final CrossAxisAlignment contentAlignment;
  final Widget? title;
  final double titleVerticalGap;
  final double contentVerticalGap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final bodyStyle = textTheme.bodyLarge?.withColor(foregroundColor);
    final titleStyle = textTheme.headlineSmall?.withColor(foregroundColor);
    final title = this.title;

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: backgroundColor,
        clipBehavior: clipBehavior,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTextStyle.merge(
            style: bodyStyle,
            child: IconTheme.merge(
              data: IconThemeData(color: foregroundColor),
              child: Column(
                crossAxisAlignment: contentAlignment,
                children: [
                  if (title != null)
                    DefaultTextStyle.merge(style: titleStyle, child: title),
                  if (title != null && children.isNotEmpty)
                    SizedBox(height: titleVerticalGap),
                  if (children.isNotEmpty)
                    Column(
                      crossAxisAlignment: contentAlignment,
                      children: children.withVerticalSpace(contentVerticalGap),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
