import 'package:flutter/material.dart';
import 'package:flutter_likeimage_app/model/item_model.dart';
import 'package:flutter_likeimage_app/provider/item_provider.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';

class SwipeBody extends StatelessWidget {
  const SwipeBody({
    super.key,
    required this.isFavorite,
    // required this.items,
  });

  final isFavorite;
  // final items;

  @override
  Widget build(BuildContext context) {
    final dataItem =Provider.of<ItemProvider>(context);
    final items = isFavorite ? dataItem.showItemFavorite() : dataItem.items;

    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 370,
      itemHeight: 680,
      itemCount: items.length,
      itemBuilder: (BuildContext context, index) {
        print(index);
        return ChangeNotifierProvider.value(
          value: items[index],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.white10,
                title: Consumer<Item>(
                  builder: (context, item, child) {
                    return InkWell(
                      onTap: (() {
                        item.toggleIsFavorite();
                      }),
                      child:  Icon(
                        Icons.favorite,
                        size: 30,
                        color: item.isFavorite ? Colors.red : Colors.white,
                        )
                    );
                  },
                ),
                subtitle: const Text("Like Image"),
                trailing: Text(
                  items[index].name,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              child: Image.asset(
                items[index].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
