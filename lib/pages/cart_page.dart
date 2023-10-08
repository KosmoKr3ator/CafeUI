
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //List<CartItem> cart = [];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.cart[index];
          return ListTile(
            title: Text(cartItem.itemName),
            subtitle: Text('Price: BDT ${cartItem.itemPrice.toStringAsFixed(2)}'),
            trailing: Text('Quantity: ${cartItem.quantity.toString()}'),
          );
        },
      ),
    );
  }
}


class CartProvider with ChangeNotifier {
  List<CartItem> cart = [];

  void addToCart(CartItem item) {
    cart.add(item);
    notifyListeners();
  }
}

class CartItem {
  final String itemName;
  final double itemPrice;
  final int quantity;

  CartItem({
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });
}