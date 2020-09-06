import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grasser'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          _Grass(),
          Center(
            child: Text('Index 1: Setting'),
          ),
        ],
      ),
      // (1) ここで下部のデザインを設定
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Grass'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        // (2) 選択したタブのindexを保持
        onTap: _onItemTapped,
      ),
    );
  }
}

class _Grass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GrassState();
  }
}

class _GrassState extends State<_Grass> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    print('build _Grass');
    return InkWell(
      onTap: () => setState(() {
        _counter++;
        if (_counter > 4) {
          _counter = 0;
        }
      }),
      child: Center(
        // child: Text('$_counter'),
        // child: Container(
        //   height: 300,
        //   width: 300,
        //   decoration: BoxDecoration(color: Colors.green, boxShadow: const [
        //     BoxShadow(blurRadius: 10),
        //   ]),
        // ),
        child: Container(
            alignment: Alignment.center,
            width: 375,
            height: 375,
            child: fourWeekGrassWidget(count: _counter)),
      ),
    );
  }
}

Row fourWeekGrassWidget({double size = 30, int count = 4}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      weekGrassWidgetWithLabel(count: count),
      weekGrassWidgetWithLabel(count: count),
      weekGrassWidgetWithLabel(count: count, label: "Sep"),
      weekGrassWidgetWithLabel(count: count),
    ],
  );
}

Column weekGrassWidgetWithLabel(
    {double size = 30, int count = 4, String label = ""}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Center(
        child: Text(label),
      ),
      weekGrassWidget(count: count),
    ],
  );
}

Column weekGrassWidget({double size = 30, int count = 4}) {
  var random = new math.Random();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      grassWidget(count: random.nextInt(5)),
      grassWidget(count: random.nextInt(5)),
      grassWidget(count: random.nextInt(5)),
      grassWidget(count: random.nextInt(5)),
      grassWidget(count: random.nextInt(5)),
      grassWidget(count: random.nextInt(5)),
      grassWidget(count: count),
    ],
  );
}

Container grassWidget({double size = 30, int count = 4}) {
  const _colors = <Color>[
    Color.fromARGB(250, 235, 237, 240),
    Color.fromARGB(250, 172, 230, 174),
    Color.fromARGB(250, 105, 192, 110),
    Color.fromARGB(250, 84, 157, 87),
    Color.fromARGB(250, 56, 107, 62),
  ];
  return Container(
    margin: const EdgeInsets.all(8),
    width: size,
    height: size,
    decoration: BoxDecoration(color: _colors[count], boxShadow: const [
      BoxShadow(blurRadius: 1),
    ]),
  );
}
