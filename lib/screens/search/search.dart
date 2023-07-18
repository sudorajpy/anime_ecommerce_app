import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    print(Colors.purple.value);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Stack(
        children: [Image.asset('assets/images/titan_wall.png')],
      )),
    );
  }
}
