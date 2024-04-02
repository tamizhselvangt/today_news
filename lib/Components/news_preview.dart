import 'package:flutter/material.dart';



class NewsPreview extends StatelessWidget {
  const NewsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "HEADLINE",

      ),
    );
  }
}
// Future<Article> fetchData() async {
//   var _API = "pub_41145d5b3721c3412c43285bcf68a8750e910";
//   var _url = "https://newsdata.io/api/1/news?apikey=pub_41145d5b3721c3412c43285bcf68a8750e910&country=in&language=en";
//   final response = await http.get(Uri.parse(_url));
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     return Article.fromJson(json['results'] as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to load news data');
//   }
// }