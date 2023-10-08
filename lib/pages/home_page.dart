
import 'package:cafe_ui/pages/cart_page.dart';
import 'package:cafe_ui/tab/candy_tab.dart';
import 'package:cafe_ui/tab/cold_beverage_tab.dart';
import 'package:cafe_ui/tab/donut_tab.dart';
import 'package:cafe_ui/tab/hot_beverage_tab.dart';
import 'package:cafe_ui/tab/hot_food_tab.dart';
import 'package:cafe_ui/tab/snacks_tab.dart';
import 'package:cafe_ui/tab/stationary_tab.dart';
import 'package:cafe_ui/util/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
    }
  return Color(int.parse(hexColor, radix: 16));
}

class _HomePageState extends State<HomePage> {
  // my tabs
  List<Widget> myTabs = const [
    
    // SnacksTab()
    MyTab(iconPath: 'assets/icons/snack.png',),

    // CandyTab()
    MyTab(iconPath: 'assets/icons/candy.png',),

    // PastryTab()
    MyTab(iconPath: 'assets/icons/pastry.png',),

    // HotFoodTab()
    MyTab(iconPath: 'assets/icons/samosa.png',),

    //ColdBeverageTab()
    MyTab(iconPath: 'assets/icons/soda-can.png',),

    //HotBeverageTab()
    MyTab(iconPath: 'assets/icons/tea.png',),

    //StationaryTab()
    MyTab(iconPath: 'assets/icons/stationary.png',),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                          'CAFE NWU',
                          style: TextStyle(
                            fontSize: 32, 
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
              )
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: () {
                  // open drawer
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.grey[800],
                    size: 36,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Cart(),),);
                  },
                ),
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: false,
        body: Column(
          children: [
            const SizedBox(height: 17,),
            // tab bar
            TabBar(tabs: myTabs),
        
            // tab bar view
            Container(
              /*height: .75 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexStringToColor("0cc1e6"),
                    hexStringToColor("097964"),
                    hexStringToColor("020024")                         
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.5, 1.0]
                )
              ),*/
              child: const Expanded(
                child: TabBarView(
                  children: [
                    
                    SnacksTab(),
                    CandyTab(),
                    DonutTab(),
                    // PastryTab()
                    HotFoodTab(),
                    ColdBeverageTab(),
                    HotBeverageTab(),
                    StationaryTab()  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
