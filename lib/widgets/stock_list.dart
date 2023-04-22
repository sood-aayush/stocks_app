import 'package:flutter/material.dart';
import '../models/stock_details.dart';
import 'package:http/http.dart';
import 'dart:convert';

class StockList extends StatefulWidget {
  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    List<String> initalstocks = [
      "MSFT",
      "TCS",
      "IBM",
      "TSLA",
      "AMZN",
      "SKYX",
      "AAPL",
      "ARVL",
      "ABNB",
    ];
    int i = 1;
    for (String element in initalstocks) {
      Response mydata = await get(Uri.parse(
          "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=${element.toString()}&interval=5min&apikey=YEEGKLZNZKC9E9W6"));

      Map decodeBodyData = jsonDecode(mydata.body);
      Map body_data = decodeBodyData["Time Series (5min)"];
      final bodyMap = body_data.values.toList();
      final body_data_values = bodyMap.asMap();
      Map final_data = body_data_values[0];

      String opening = final_data["1. open"];
      String closing = final_data["4. close"];
      stockname.add(Stock(
        id: i,
        name: element.toString(),
        open: opening.toString(),
        close: closing.toString(),
      ));

      i += 1;
      setState(() {});
    }
  }

  List<Stock> stockname = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 1,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            Column(
              children: stockname.map((stx) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            stx.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Open:     \$${stx.open.toString()}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Close:     \$${stx.close.toString()}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
