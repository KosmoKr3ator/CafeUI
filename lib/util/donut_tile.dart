import 'package:flutter/material.dart';

class DonutTile extends StatefulWidget {
  final String donutFlavor;
  final String donutPrice;
  final donutColor;
  final String brand;
  final String imageName;


  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName, 
    required this.brand,
  });

  @override
  State<DonutTile> createState() => _DonutTileState();
}

class _DonutTileState extends State<DonutTile> {
  final double borderRadius = 12;
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.donutColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: <Widget>[
            // Item price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.donutColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '\$${widget.donutPrice}',
                    style: TextStyle(
                      color: widget.donutColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 0.0141 * MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ],
            ),

            // Item picture
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
              child: Image.asset(widget.imageName),
            ),

            // Item Name
            Text(
              widget.donutFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:  0.016 * MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.brand,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 0.01448 * MediaQuery.of(context).size.width,
                ),
            ),
            const SizedBox(height: 3),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.grey[800],
                      size: 0.022 * MediaQuery.of(context).size.width,
                    ),
                    onPressed: () {
                      setState(() {
                        if (itemCount > 0) {
                          itemCount--;
                        }
                      });
                    },
                  ),
                  Text(
                    itemCount.toString(),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 0.020 * MediaQuery.of(context).size.width,
                    ),

                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                      size: 0.022 * MediaQuery.of(context).size.width,
                    ),
                    onPressed: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                  ),
                ]
              ),
              const SizedBox(height: 1),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 0.015 * MediaQuery.of(context).size.width,
                        ),
                        label: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 0.0135 * MediaQuery.of(context).size.width,
                          ),
                              
                          ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: widget.donutColor[100],
                          foregroundColor: widget.donutColor[800],
                        ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
