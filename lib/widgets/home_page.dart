import 'package:flutter/material.dart';
import 'package:stocks_app/widgets/stock_list.dart';

import './clock.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Stonks',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ClockWidget(),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
      body: StockList(),
    );
  }
}
