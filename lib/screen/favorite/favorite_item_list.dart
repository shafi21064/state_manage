import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/favorite_provider.dart';
import 'package:state_manage/provider/theme_changer_provider.dart';

class FavoriteItemList extends StatelessWidget {
  const FavoriteItemList({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
        centerTitle: true,
        actions: [
          Consumer<FavouriteProvider>(
            builder: (context, value, child) {
              return Badge(
                label: Text(value.favorite.length.toString()),
                  child: Icon(Icons.favorite));
            }
          ),
          SizedBox(width: 10,),
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return InkWell(
                onTap: (){
                  value.isDark? value.setTheme(false): value.setTheme(true);
                  print(value.isDark);
                },
                  child: Icon(value.isDark?Icons.wb_sunny : Icons.dark_mode_outlined));
            }
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
          itemBuilder: (context, index){
          return Consumer<FavouriteProvider>(
            builder: (context, value, child) {
              return ListTile(
                onTap: (){
                  if(value.favorite.contains(index)){
                    value.removeItem(index);
                  }else{
                    value.addItem(index);
                  }
                },
                title: Text('Item $index'),
                trailing: Icon(value.favorite.contains(index)? Icons.favorite : Icons.favorite_outline),
              );
            }
          );
          }
      ),
    );
  }
}
