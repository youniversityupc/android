import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

import 'package:youniversity_app/utils/fetch_advice.dart';

class DailyAdvice extends StatefulWidget {
  const DailyAdvice({super.key});

  @override
  State<DailyAdvice> createState() => _DailyAdviceState();
}

class _DailyAdviceState extends State<DailyAdvice> {
  late Future dailyAdvice;

  @override
  void initState() {
    super.initState();
    dailyAdvice = fetchAdvice();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Center(
      child: FutureBuilder(
        future: dailyAdvice,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.advice,
                style: textTheme.bodyLarge?.withColor(AppColorPalette.gray900));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
