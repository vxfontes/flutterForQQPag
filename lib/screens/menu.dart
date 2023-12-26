import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/food_item.dart';
import 'package:panucci_ristorante/components/titles.dart';
import 'package:panucci_ristorante/data/cardapio.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const MainTitle(text: 'Menu'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FoodItem(
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                  imageURI: items[index]['image'],
                );
              },
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
