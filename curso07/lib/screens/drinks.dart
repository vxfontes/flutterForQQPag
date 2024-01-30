import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/drink_item.dart';
import 'package:panucci_ristorante/components/titles.dart';
import 'package:panucci_ristorante/data/cardapio.dart';

class Drinks extends StatelessWidget {
  const Drinks({super.key});

  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: [
          const MainTitle(text: 'Bebidas'),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DrinkItem(
                  imageURI: items[index]["image"],
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                );
              },
              childCount: items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape ? 1.2 : 158/194,
            ),
          ),
        ],
      ),
    );
  }
}
