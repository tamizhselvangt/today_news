import 'package:day_today/utilities/coinModel.dart';
import 'package:day_today/Components/cTopCryptoInfo.dart';
import 'package:day_today/Components/cCryptoCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoPage extends StatefulWidget {

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffabc4ff),
      ),
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: const BoxDecoration(
          color: Color(0xffabc4ff)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      'Portfolio',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Live Crypto Rates',
                    style: TextStyle(
                    fontSize: 30,
                    fontFamily: "PolySans",
                    fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              child: const Row(
                children: [
                  Text(
                    '+162% all time',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              height: myHeight * 0.7,
              width: myWidth,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey.shade300,
                        spreadRadius: 3,
                        offset: const Offset(0, 3))
                  ],
                  color:const Color(0xffF1F5FF),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: ListView(
                children: [
                  const SizedBox(
                   height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Assets',
                          style: TextStyle(fontSize: 20,
                          fontFamily: "PolySans"),
                        ),
                        // Icon(Icons.add)
                      ],
                    ),
                  ),
                  Container(
                    height: myHeight * 0.5,
                    child: isRefreshing == true
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffFBC700),
                      ),
                    )
                        : coinMarket == null || coinMarket!.length == 0
                        ? Padding(
                      padding: EdgeInsets.all(myHeight * 0),
                      child: const Center(
                        child: Text(
                          'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TopCryptoInfoWidget(
                          item: coinMarket![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                    child: const Text(
                      'Recommend to Buy',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: myWidth,
                    child: Padding(
                      padding: EdgeInsets.only(left: myWidth * 0.03),
                      child: Container(
                        child: isRefreshing == true
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffFBC700),
                          ),
                        )
                            : coinMarket == null || coinMarket!.length == 0
                            ? Padding(
                          padding: EdgeInsets.all(myHeight * 0.06),
                          child: const Center(
                            child: Text(
                              'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                            : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: coinMarket!.length,
                          itemBuilder: (context, index) {
                            return CryptoCard(
                              item: coinMarket![index],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.01,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
