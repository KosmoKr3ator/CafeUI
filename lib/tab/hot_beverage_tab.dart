import 'package:cafe_ui/pages/cart_page.dart';
import 'package:cafe_ui/util/common_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotBeverageTab extends StatefulWidget {
  const HotBeverageTab({super.key});

  @override
  State<HotBeverageTab> createState() => _HotBeverageTabState();
}

class _HotBeverageTabState extends State<HotBeverageTab> {

  List itemOnSale = [
    // [ Name, Price, Brand, Color, image path ]
    ["Ice Cream", "16", "Dunkins", Colors.blue, "assets/images/strawberry_donut.png"],
    ["Ice Hot", "36", "Dunkins", Colors.blue, "assets/images/icecream_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemOnSale.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1 / 1.79,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: ItemTile(
            itemName: itemOnSale[index][0],
            itemPrice: itemOnSale[index][1],
            itemBrand: itemOnSale[index][2],
            itemColor: itemOnSale[index][3],
            itemImage: itemOnSale[index][4],
          )
        );
      }
    );
  }
}