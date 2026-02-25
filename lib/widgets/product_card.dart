import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/product_provider.dart';
import '../screens/webview_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    final preference = provider.preferences[product.id];

    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(product.image, height: 120),
            const SizedBox(height: 10),
            Text(product.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("\$${product.price}"),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.thumb_up,
            color: preference == "liked"
                ? Colors.green
                : Colors.grey,
          ),
          onPressed: () {
            provider.setPreference(product.id, "liked");

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Liked")),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.thumb_down,
            color: preference == "disliked"
                ? Colors.red
                : Colors.grey,
          ),
          onPressed: () {
            provider.setPreference(product.id, "disliked");

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Disliked")),
            );
          },
        ),
      ],
    ),
    ElevatedButton(
      child: const Text("Open"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WebViewScreen(
              url:
                  "${product.image}?productId=${product.id}&title=${Uri.encodeComponent(product.title)}&price=${product.price}",
            ),
          ),
        );
      },
    )
  ],
)
          ],
        ),
      ),
    );
  }
}