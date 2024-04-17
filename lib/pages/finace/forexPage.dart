import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:day_today/utilities/forexApi.dart';




class ForexPage extends StatefulWidget {
  const ForexPage({super.key});

  @override
  State<ForexPage> createState() => _ForexPageState();
}

class _ForexPageState extends State<ForexPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDCDF4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  TextButton(onPressed: () async{
                     forexExchange();
                  }, child: Text("Press"))
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              color: Colors.white,
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
                Container(
                  height: MediaQuery.of(context).size.height/2.3,
                  child: FutureBuilder<List<Quote>>(
                    future: forexExchange(),
                    builder: (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
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
                )
              ],
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
          color: Colors.black.withOpacity(0.05),
        ),
        color: Colors.black.withOpacity(0.05),
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






