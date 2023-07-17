import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/gridview_builder.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key, required this.titleName});

  final String? titleName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(titleName!),
        ),
        body: Container(
          child: Column(children: [
            Expanded(
                child: Container(
              child: GridViewBuilder(scrollPhysics: BouncingScrollPhysics(),itemCount: 10,),
            ))
          ]),
        ));
  }
}



