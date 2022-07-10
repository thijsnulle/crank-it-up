import 'package:crank_it_up/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppHeader {
  static AppBar create(
    String headline1,
    String? headline2,
    Function()? function,
    IconData? icon,
    CrossAxisAlignment crossAxisAlignment,
    BuildContext context, {
    List<Widget> actions = const [],
  }) {
    return AppBar(
      leading: (icon != null)
          ? IconButton(
              onPressed: function ??
                  () {
                    HapticFeedback.mediumImpact();
                    Navigator.of(context).pop();
                  },
              icon: Icon(icon),
            )
          : null,
      title: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(headline1, style: Theme.of(context).textTheme.headline1),
          if (headline2 != null) ...[
            Text(headline2, style: Theme.of(context).textTheme.headline2),
          ]
        ],
      ),
      centerTitle: true,
      actions: actions,
      toolbarHeight: 200,
      backgroundColor: colorScheme.surfaceVariant,
      shadowColor: Colors.transparent,
    );
  }
}
