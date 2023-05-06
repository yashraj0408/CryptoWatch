import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'services/network.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<Text> getCurrencyList() {
    List<Text> currencyItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      currencyItems.add(newItem);
    }

    return currencyItems;
  }

  // List<DropdownMenuItem<String>> getDropDownItems() {
  //   List<DropdownMenuItem<String>> dropDownItems = [];
  //
  //   for (String currency in currenciesList) {
  //     var newItem = DropdownMenuItem(
  //       child: Text(currency),
  //       value: currency,
  //     );
  //     dropDownItems.add(newItem);
  //   }
  //
  //   return dropDownItems;
  // }

  String selectedCurrency = 'INR';

  String btcValue = '?';
  String ethValue = '?';
  String cotiValue = '?';

  // CoinData coinData = CoinData();

  void getData() async {
    try {
      dynamic data = await CoinData().getCoinData();
      setState(() {
        btcValue =
            data['bitcoin'][selectedCurrency.toLowerCase()].toStringAsFixed(0);
        ethValue =
            data['ethereum'][selectedCurrency.toLowerCase()].toStringAsFixed(0);
        cotiValue =
            data['coti'][selectedCurrency.toLowerCase()].toStringAsFixed(4);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btcValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ethValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 COTI = $cotiValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (selectedItem) {
                setState(() {
                  selectedCurrency = currenciesList[selectedItem];
                  getData();
                });
              },
              children: getCurrencyList(),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
// value: selectedCurrency,
// items: getDropDownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value;
// });
// }),
