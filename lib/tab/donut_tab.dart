import 'package:cafe_ui/util/donut_tile.dart';
import 'package:flutter/material.dart';


class DonutTab extends StatefulWidget {
  const DonutTab({super.key});

  @override
  State<DonutTab> createState() => _DonutTabState();
}

class _DonutTabState extends State<DonutTab> {
  // list of donuts
  List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", "Dunkins", Colors.blue, "assets/images/icecream_donut.png"],
    ["Strawberry", "45", "Dunkins", Colors.red, "assets/images/strawberry_donut.png"],
    ["Grape Ape", "84", "Dunkins", Colors.purple, "assets/images/grape_donut.png"],
    ["Choco", "95", "Dunkins", Colors.brown, "assets/images/chocolate_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1 / 1.79,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          brand: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
        );
      },
    );
  }
}
