import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class TopCryptoInfoWidget extends StatelessWidget {
  final item;
  const TopCryptoInfoWidget({super.key,this.item});

  @override
  Widget build(BuildContext context) {

    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.05,
           vertical: myWidth * 0.04),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
                height: myHeight * 0.09, child: Image.network(item.image)),
          ),
          SizedBox(
            width: myWidth * 0.02,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.id,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                   item.symbol,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: myHeight * 0.05,
              width: myWidth * 0.2,
              child: Sparkline(
                data: item.sparklineIn7D.price,
                lineWidth: 2.0,
                lineColor: item.marketCapChangePercentage24H >= 0
                    ? Colors.green
                    : Colors.red,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.7],
                    colors: item.marketCapChangePercentage24H >= 0
                        ? [Colors.green, Colors.green.shade100]
                        : [Colors.red, Colors.red.shade100]),
              ),
            ),
          ),
          SizedBox(
            width: myWidth * 0.02,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ ${item.currentPrice}',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      item.priceChange24H.toString().contains('-')
                          ? "-\$${item.priceChange24H
                              .toStringAsFixed(2)
                              .toString()
                              .replaceAll('-', '')}"
                          : "\$${item.priceChange24H.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: myWidth * 0.01,
                    ),
                    Text(
                      item.marketCapChangePercentage24H.toStringAsFixed(2) +
                          '%',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: item.marketCapChangePercentage24H >= 0
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
