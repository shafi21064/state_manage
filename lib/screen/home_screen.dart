import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/counter_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 0), (timer) {
      counterProvider.setCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: const TextStyle(
                  fontSize: 50
                ),);
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterProvider.setCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
