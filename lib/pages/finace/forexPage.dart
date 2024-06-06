import 'package:flutter/cupertino.dart';
import 'package:day_today/utilities/forexApi.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:day_today/utilities/forexApi.dart';
import 'dart:convert';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';

// And finally, use and customize the widget:
// final spinner = NutsActivityIndicator(
//   activeColor: Colors.indigo,
//   inactiveColor: Colors.blueGrey,
//   tickCount: 24,
//   relativeWidth: 0.4,
//   radius: 60,
//   startRatio: 0.7,
//   animationDuration: Duration(milliseconds: 500),
// );

class ForexPage extends StatefulWidget {
  const ForexPage({super.key});

  @override
  State<ForexPage> createState() => _ForexPageState();
}

class _ForexPageState extends State<ForexPage> {
  late TrackballBehavior trackballBehavior;
   var  forexExchangeData;
   var  candleData;

  @override
  void initState() {
    forexExchangeData = forexExchange();
    candleData = fetchCandleData();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCDCDF4),
        title: Text("EUR/USD",
          style: TextStyle(
              fontFamily: "PolySans",
              fontSize: 25
          ),),
      ),
      backgroundColor: Color(0xffCDCDF4),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SafeArea(
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     TextButton(onPressed: (){}, child: Text("5", style: TextStyle(color: Colors.black54),)),
                    //     TextButton(onPressed: (){}, child: Text("10", style: TextStyle(color: Colors.black54),)),
                    //     TextButton(onPressed: (){}, child: Text("15", style: TextStyle(color: Colors.black54),)),
                    //     TextButton(onPressed: (){}, child: Text("30", style: TextStyle(color: Colors.black54),)),
                    //     TextButton(onPressed: (){}, child: Text("60", style: TextStyle(color: Colors.black54),)),
                    //   ],
                    // ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        child: FutureBuilder(
                          future: candleData,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final jsonData = jsonDecode(snapshot.data as String);
                              final candleDataList = _parseForexData(jsonData);

                              return SfCartesianChart(
                                primaryXAxis: DateTimeAxis(),
                                trackballBehavior: trackballBehavior,
                                zoomPanBehavior: ZoomPanBehavior(
                                    enablePinching: true, zoomMode: ZoomMode.x),
                                series: [
                                  CandleSeries<CandleData, DateTime>(
                                    dataSource: candleDataList,
                                    xValueMapper: (CandleData data, _) => data.timeStamp,
                                    openValueMapper: (CandleData data, _) => data.open,
                                    highValueMapper: (CandleData data, _) => data.high,
                                    lowValueMapper: (CandleData data, _) => data.low,
                                    closeValueMapper: (CandleData data, _) => data.close,
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xfff40a0a),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(65),
                  topRight: Radius.circular(65),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'top 10 instruments'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: FutureBuilder<List<Quote>>(
                        future: forexExchangeData,
                        builder: (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Color(0xff29f40a),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if(snapshot.hasData) {
                            List<Quote> quotes = snapshot.data!;
                            quotes = quotes.where((quote) => quote.baseCurrency != quote.quoteCurrency).toList();
                            return ListView.builder(
                              itemCount: quotes.length,
                              itemBuilder: (BuildContext context, int index) {
                                Quote quote = quotes[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TopTenInstrument(baseCurrency: quote.baseCurrency,
                                  quoteCurrency: quote.quoteCurrency,
                                  bidPrice: quote.bid,
                                  askPrice: quote.ask,
                                  midPoint: quote.midpoint,),
                                );
                              },
                            );
                          }else{
                            return Text("The request has an error");
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class TopTenInstrument extends StatelessWidget {

  final baseCurrency;
  final quoteCurrency;
  final bidPrice;
  final askPrice;
  final midPoint;

  TopTenInstrument({this.baseCurrency,this.quoteCurrency,this.bidPrice,this.askPrice,this.midPoint});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/currencies/${baseCurrency.toString().toLowerCase()}.png'),
                      radius: 15,
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/currencies/${quoteCurrency.toString().toLowerCase()}.png'),
                      radius: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                ("${baseCurrency+"-"+quoteCurrency}").replaceAll('_', '-'),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bid: ${double.parse(bidPrice.toStringAsFixed(3))}'.toUpperCase(),
                style:TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ask: ${double.parse(askPrice.toStringAsFixed(3))}'.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'SpreadValue',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${double.parse(midPoint.toStringAsFixed(4))}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                child: IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.red[500],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}






List<CandleData> _parseForexData(Map<String, dynamic> jsonData) {
  final forexDataList = <CandleData>[];

  final timeSeries = jsonData['Time Series FX (5min)'] as Map<String, dynamic>;
  timeSeries.forEach((time, data) {
    final parsedTime = DateTime.parse(time);
    final forexData = CandleData(
      timeStamp: parsedTime,
      open: double.parse(data['1. open']),
      high: double.parse(data['2. high']),
      low: double.parse(data['3. low']),
      close: double.parse(data['4. close']),
    );
    forexDataList.add(forexData);
  });

  return forexDataList;
}