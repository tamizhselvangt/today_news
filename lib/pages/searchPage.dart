
import 'package:flutter/material.dart';


class MySearchDelegate extends SearchDelegate{

  List<String> seaarchResults = [
    'Politics',
    'India',
    'Movies',
    'Cricket',
    'Crypto',
    'SenSex',
    'BitCoin',
    'Apple',
    'Tech',
    'RSS',
    'Election',
    'Sports'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(onPressed: (){
      if(query.isEmpty) {
        close(context, null);
      }else{
        query = "";
      }
    }, icon: Icon(Icons.close_rounded,
    color: Colors.black54,))];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: (){
        close(context, null);
      }, icon: Icon(Icons.arrow_back_ios_new_outlined,
  color: Colors.black54,));


  @override
  Widget buildResults(BuildContext context) {
     return Center(
       child: Text(
         query,
         style: TextStyle(
           fontSize: 24,
           fontFamily: "PolySans"
         ),
       ),
     );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = seaarchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(suggestion,
            style: TextStyle(
              fontFamily: "PolySans",
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
          ),
          onTap: (){
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {

    // Theme.of(context).copyWith(
    //   scaffoldBackgroundColor: Color(0xffCEFFD3),
    //   appBarTheme: AppBarTheme(
    //     backgroundColor:  Color(0xffCEFFD3)
    //   )
    // );
    final ThemeData customTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xffCEFFD3),
      inputDecorationTheme: InputDecorationTheme(

        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:Colors.transparent),
        ),
        labelStyle: TextStyle(color: Colors.grey.shade500,
        fontSize: 20),
        hintStyle: TextStyle(color: Colors.grey.shade500,
        fontSize: 20),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffCEFFD3)
      ),
      textTheme: TextTheme(

      )
    );
    return customTheme;
  }
}