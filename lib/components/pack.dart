import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class PackCard extends StatefulWidget {
  final String name;
  final String img;

  const PackCard({super.key, required this.name, required this.img});

  @override
  PackCardState createState() => PackCardState();
}

class PackCardState extends State<PackCard> {
  final GlobalKey<PackCardState> packCardKey = GlobalKey<PackCardState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: packCardKey,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        boxShadow: const [BoxShadow(color: Color(0x66000000), blurRadius: 12)],
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(children: [
        createImage(widget.img),
        createTitle(widget.name),
        createOverlay(widget.name),
        GestureDetector(onTap: () => updatePackState(widget)),
      ]),
    );
  }

  Widget createImage(String img) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: Svg('assets/images/${widget.img}', color: colorScheme.onPrimaryContainer)))),
    );
  }

  Widget createTitle(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(alignment: Alignment.bottomCenter, child: Text(widget.name, style: Theme.of(context).textTheme.headline5)),
    );
  }

  Widget createOverlay(String name) {
    Pack clickedPack = packs.firstWhere((element) => element.name == name);

    if (!clickedPack.isSelected) return Container();

    return Container(
      color: colorScheme.background.withOpacity(0.5),
      constraints: const BoxConstraints.expand(),
      child: const Align(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.only(left: 8.0, top: 8.0), child: Icon(Icons.check_rounded, color: Color.fromARGB(255, 26, 200, 35), size: 36.0))),
    );
  }

  void updatePackState(PackCard packCard) {
    int numberOfPacksSelected = packs.where((element) => element.isSelected).length;
    Pack clickedPack = packs.firstWhere((element) => element.name == packCard.name);

    if (numberOfPacksSelected == 1 && clickedPack.isSelected) {
      alert('Cannot deselect all packs.', context);
      return;
    }

    setState(() {
      HapticFeedback.mediumImpact();
      clickedPack.isSelected = !clickedPack.isSelected;
    });
  }
}
