import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gridview_002/random_list_generator.dart';
import 'package:gridview_002/timer_refresher.dart';

void main() {
  runApp(const GridApp());
}

class GridApp extends StatelessWidget {
  const GridApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Streams Grid Demo - Observer Pattern';
    return MaterialApp(
      title: 'Grid Demo - Observer Pattern',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const GridHomePage(
        title: appTitle,
      ),
    );
  }
}

class GridHomePage extends StatefulWidget {
  final String title;

  const GridHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<GridHomePage> createState() => _GridHomePageState();
}

class _GridHomePageState extends State<GridHomePage> {
  late TimerRefresher _timerRefresher;

  @override
  void initState() {
    _timerRefresher = TimerRefresher();
    super.initState();
  }

  @override
  void dispose() {
    _timerRefresher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          StreamBuilder<List<int>>(
            stream: _timerRefresher.numbersStream,
            initialData: RandomListGenerator.generateRandomNumbersList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  crossAxisCount: 8,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: List.generate(
                    64,
                    (index) => Center(
                      child: Text(
                        snapshot.data![index].toString(),
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('No data!'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
