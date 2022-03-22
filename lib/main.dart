// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/counter_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (context) => CounterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text("Counter App Using Provider",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
        child: Column(
          children: [
            Center(
              child: Consumer<CounterModel>(
                builder: ((context, CounterModel, child) {
                  return Text(
                    "${CounterModel.counter}",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false)
                        .incrementcounter();
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.black,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false)
                        .decrementcounter();
                  },
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.yellow,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
