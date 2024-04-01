import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person))
        ],
      ),
      body:ListView(

      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home_filled)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.settings))
          ],
        ),
      ),
    );
  }
}
