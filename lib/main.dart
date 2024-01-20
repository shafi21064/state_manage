import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/counter_provider.dart';
import 'package:state_manage/provider/example_one_provider.dart';
import 'package:state_manage/screen/example_one.dart';
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
    ],child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamPleOne(),
    ),);
  }
}
