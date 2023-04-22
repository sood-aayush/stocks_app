import 'package:flutter/material.dart';
import './widgets/home_page.dart';

void main() {
  runApp(const Stocks());
}

class Stocks extends StatelessWidget {
  const Stocks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Stonks',
    );
  }
}
