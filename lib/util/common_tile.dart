import 'package:cafe_ui/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String itemBrand;
  final String itemImage;
  final itemColor;

  const ItemTile({
    super.key, 
    required this.itemName, 
    required this.itemBrand, 
    required this.itemPrice, 
    required this.itemImage, 
    this.itemColor
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final double borderRadius = 12;
  int itemCount = 0;

  void addToCart() {
    // Create a CartItem and add it to the cart list
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart(
      CartItem(
        itemName: widget.itemName,
        itemPrice: double.parse(widget.itemPrice),
        quantity: itemCount,
      )
    );

    // Show a snackbar to confirm item addition
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.itemName} added to cart.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // widget.itemColor[50],
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
                    color: Colors.blue, // widget.itemColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'BDT ${widget.itemPrice}',
                    style: TextStyle(
                      color: Colors.white, // widget.itemColor[800],
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
              child: Image.asset(widget.itemImage),
            ),

            // Item Name
            Text(
              widget.itemName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:  0.016 * MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.itemBrand,
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
                        onPressed: addToCart,
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
                          backgroundColor: Colors.blue, //widget.itemColor[100],
                          foregroundColor: Colors.white //widget.itemColor[800],
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