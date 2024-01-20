import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/counter_provider.dart';
import 'package:state_manage/provider/example_one_provider.dart';
import 'package:state_manage/provider/favorite_provider.dart';
import 'package:state_manage/provider/theme_changer_provider.dart';
import 'package:state_manage/screen/example_one.dart';
import 'package:state_manage/screen/favorite/favorite_item_list.dart';
import 'package:state_manage/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> CounterProvider()),
      ChangeNotifierProvider(create: (_)=> SliderProvider()),
      ChangeNotifierProvider(create: (_)=> FavouriteProvider()),
      ChangeNotifierProvider(create: (_)=> ThemeChangerProvider())
    ],
      child: Consumer<ThemeChangerProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: value.isDark?
            ThemeData(
              brightness: Brightness.dark,
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //useMaterial3: true,
            ) :
            ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.green,
                primarySwatch: Colors.green
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //useMaterial3: true,
            ),

            home: const FavoriteItemList(),
          );
        }
      ),);
  }
}


