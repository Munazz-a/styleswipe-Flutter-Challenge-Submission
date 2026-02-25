import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Browsing History")),
      body: provider.history.isEmpty
          ? const Center(child: Text("No browsing history yet"))
          : ListView.builder(
              itemCount: provider.history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(
                    provider.history[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
    );
  }
}