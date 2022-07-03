import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CRANK', style: Theme.of(context).textTheme.headline1),
            Wrap(children: [
              Text('IT', style: Theme.of(context).textTheme.headline2),
              Text('UP', style: Theme.of(context).textTheme.headline1),
            ])
          ],
        ));
  }
}
