import 'package:crank_it_up/app.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class Overlay extends StatefulWidget {
  bool isSelected;
  int id;

  Overlay({super.key, required this.isSelected, required this.id});

  @override
  _Overlay createState() => _Overlay();
}

class _Overlay extends State<Overlay> with AutomaticKeepAliveClientMixin<Overlay> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
        onTap: () {
          setState(() {
            app.packs[widget.id].isSelected = !widget.isSelected;
            widget.isSelected = !widget.isSelected;
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.isSelected ? Colors.black.withOpacity(0.5) : Colors.transparent),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Icon(
                Icons.check_rounded,
                color: widget.isSelected ? const Color.fromARGB(255, 26, 200, 35) : Colors.transparent,
                size: 40,
              ),
            )
          ],
        ));
  }
}

class Pack extends StatelessWidget {
  final int id;
  final String name;
  final String img;
  final List scenarios;
  final Color color;
  bool isSelected;

  Pack(
      {super.key,
      required this.id,
      required this.name,
      required this.img,
      required this.scenarios,
      required this.color,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HSLColor.fromColor(color).withLightness(0.6).toColor(),
            boxShadow: const [
              BoxShadow(
                color: Color(0x66000000),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: Svg('assets/' + img + '.svg', color: color)),
                  borderRadius: BorderRadius.circular(20))),
        ),
        Overlay(
          isSelected: isSelected,
          id: id,
        )
      ],
    ));
  }
}
