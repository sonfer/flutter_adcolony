import 'package:flutter/material.dart';
import 'package:adcolony/adcolony.dart';
import 'package:adcolony/banner.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final zones = [
    'vz9a841ab586ae4d72b9',
    'vz4eacd40a32ad4fd69c',
    'vz09f26f8ad3c340c484'
  ];
  @override
  void initState() {
    super.initState();
    AdColony.init(AdColonyOptions('app4f4659d279be4554ad', '0', this.zones));
  }

  listener(AdColonyAdListener event) {
    print(event);
    if (event == AdColonyAdListener.onRequestFilled)
      AdColony.show();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              RaisedButton(
                onPressed: () => AdColony.request(this.zones[1], listener),
                child: Text('Show Interstitial'),
              ),
              RaisedButton(
                onPressed: () => AdColony.request(this.zones[0], listener),
                child: Text('Show Interstitial Rewarded'),
              ),
              BannerView((AdColonyAdListener event) => print(event), BannerSizes.banner, this.zones[2]),
              BannerView((AdColonyAdListener event) => print(event), BannerSizes.medium, this.zones[2]),
              BannerView((AdColonyAdListener event) => print(event), BannerSizes.skyscraper, this.zones[2]),
              BannerView((AdColonyAdListener event) => print(event), BannerSizes.leaderboard, this.zones[2]),
            ],
          ),
        ),
      ),
    );
  }
}
