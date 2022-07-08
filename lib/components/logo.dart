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
            Text('CRANK', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 64.0)),
            Wrap(children: [
              Text('IT', style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 64.0)),
              Text('UP', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 64.0)),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset(
                    "assets/images/logo.gif",
                    height: 75.0,
                  )),
            ])
          ],
        ));
  }
}
