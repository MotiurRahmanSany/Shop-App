import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Cart ', style: Theme.of(context).textTheme.titleLarge),
            const Icon(
              Icons.shopping_cart_outlined,
              size: 38,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size ${cartItem['size']}',
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                        'Are you sure you want to remove this product from your cart?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .removeProduct(cartItem);
                            // Provider.of<CartProvider>(context, listen: false)
                            //     .removeProduct(cartItem);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product deleted from the cart!'),
                              ),
                            );
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
