import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class SwipeBody extends StatelessWidget {
  const SwipeBody({
    super.key, required this.items,
  });

  final items;

  @override
  Widget build(BuildContext context) {
    return Swiper(
    layout: SwiperLayout.STACK,
    itemWidth: 350,
    itemHeight: 650,
    itemCount: items.length,
    itemBuilder: (BuildContext context, index){
      print(index);
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.white10,
            title: Icon(Icons.favorite,size: 30,),
            subtitle: Text("Like Image"),
            trailing: Text(items[index].name, style: TextStyle(fontSize: 15,color: Colors.white),),
            ) ,
          child: Image.asset(
            items[index].image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }, 
    );
  }
}