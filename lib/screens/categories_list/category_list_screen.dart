

import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:anime_ecommerce_app/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/gridview_builder.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key, required this.titleName,required this.data});

  final String? titleName;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(titleName!),
        ),
        body: StreamBuilder(
            stream: FireStoreServices.getProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('No Data Found'),
                );
              } else {
                final productsCollection = snapshot.data!.docs
                    .map((doc) => doc.data() as Map<String, dynamic>)
                    .toList();
                return Container(
                  child: Column(children: [
                    Expanded(
                        child: Container(
                      child: GridViewBuilder(
                        scrollPhysics: const BouncingScrollPhysics(),
                        itemCount: productsCollection.length,
                      ),
                    ))
                  ]),
                );
              }
            }));
  }
}
