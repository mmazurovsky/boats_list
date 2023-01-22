import 'package:flutter/material.dart';

import 'features/boats_list/ui/boats_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boats list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BoatsListPage(),
    );
  }
}
