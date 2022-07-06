import 'package:flutter/material.dart';

class AppHeader {
  static AppBar create(
    String headline1,
    String? headline2,
    Function()? function,
    IconData? icon,
    BuildContext context, {
    List<Widget> actions = const [],
  }) {
    return AppBar(
      leading: (icon != null)
          ? IconButton(
              onPressed: function ?? () => Navigator.of(context).pop(),
              icon: Icon(icon),
            )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headline1, style: Theme.of(context).textTheme.headline1),
          if (headline2 != null) ...[
            Text(headline2, style: Theme.of(context).textTheme.headline2),
          ]
        ],
      ),
      actions: actions,
      toolbarHeight: 200,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
