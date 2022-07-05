import 'package:crank_it_up/app.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

//ignore: must_be_immutable
class Pack extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final List scenarios;
  final Color color;
  bool isSelected;

  Pack({
    super.key,
    required this.id,
    required this.name,
    required this.img,
    required this.scenarios,
    required this.color,
    this.isSelected = true,
  });

  @override
  PackState createState() => PackState();
}

class PackState extends State<Pack> with AutomaticKeepAliveClientMixin<Pack> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HSLColor.fromColor(widget.color).withLightness(0.6).toColor(),
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
                  image: DecorationImage(image: Svg('assets/images/${widget.img}.svg', color: widget.color)),
                  borderRadius: BorderRadius.circular(20))),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: widget.color, fontFamily: 'Montserrat', fontSize: 30, fontWeight: FontWeight.bold),
                ))),
        GestureDetector(
            onTap: () {
              setState(() {
                app.packs[widget.id].isSelected = !app.packs[widget.id].isSelected;
              });
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: app.packs[widget.id].isSelected ? Colors.black.withOpacity(0.5) : Colors.transparent),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Icon(
                    Icons.check_rounded,
                    color:
                        app.packs[widget.id].isSelected ? const Color.fromARGB(255, 26, 200, 35) : Colors.transparent,
                    size: 40,
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
