import 'package:http/http.dart' as http;
import 'dart:convert';



class Quote {
  final String baseCurrency;
  final String quoteCurrency;
  final double bid;
  final double ask;
  final double midpoint;

  Quote({required this.baseCurrency, required this.quoteCurrency, required this.bid, required this.ask, required this.midpoint});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      baseCurrency: json['base_currency'],
      quoteCurrency: json['quote_currency'],
      bid: double.parse(json['bid']),
      ask: double.parse(json['ask']),
      midpoint: double.parse(json['midpoint']),
    );
  }
}

class CandleData {
  DateTime timeStamp;
  double open;
  double high;
  double low;
  double close;

  CandleData({
    required this.timeStamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory CandleData.fromJson(Map<String, dynamic> json) {
    return CandleData(
      timeStamp: DateTime.parse(json['time']),
      open: double.parse(json['1. open']),
      high: double.parse(json['2. high']),
      low: double.parse(json['3. low']),
      close: double.parse(json['4. close']),
    );
  }
}


Future<List<Quote>> forexExchange() async {
  final personalToken = '2aa640d9-dfc0-4df6-a321-2d9a328ee4c9';
  final base_quote = "&base=USD&base=EUR&base=JPY&base=GBP&quote=EUR&quote=USD&quote=GBP&quote=JPY&quote=AUD&quote=CAD&quote=CHF&quote=NZD&quote=CHF&quote=HKD&quote=SGD";
  final url =  "https://exchange-rates-api.oanda.com/v2/rates/spot.json?api_key=${personalToken}${base_quote}";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonBody = json.decode(response.body);
    List<dynamic> quotesJson = jsonBody['quotes'];

    List<Quote> quotes = quotesJson.map((json) => Quote.fromJson(json)).toList();
    return quotes;
  } else {
    print('Error: ${response.statusCode}');
    return [];
  }
}



Future<String> fetchCandleData() async {
  final response = await http.get(Uri.parse('https://www.alphavantage.co/query?function=FX_INTRADAY&from_symbol=EUR&to_symbol=USD&interval=5min&apikey=demo'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
}







