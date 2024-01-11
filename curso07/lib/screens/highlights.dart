import 'package:flutter/cupertino.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';
import 'package:panucci_ristorante/components/titles.dart';
import 'package:panucci_ristorante/data/cardapio.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const MainTitle(text: 'Destaques'),
          MediaQuery.of(context).orientation == Orientation.landscape
              ? const _landscapeList()
              : const _portraitList(),
        ],
      ),
    );
  }
}

class _portraitList extends StatelessWidget {
  const _portraitList({Key? key}) : super(key: key);
  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return HighlightItem(
          imageURI: items[index]['image'],
          itemTitle: items[index]['name'],
          itemPrice: items[index]['price'],
          itemDescription: items[index]['description'],
        );
      },
      childCount: items.length,
    ));
  }
}

class _landscapeList extends StatelessWidget {
  const _landscapeList({Key? key}) : super(key: key);
  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: items[index]['image'],
            itemTitle: items[index]['name'],
            itemPrice: items[index]['price'],
            itemDescription: items[index]['description'],
          );
        },
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
    );
  }
}
