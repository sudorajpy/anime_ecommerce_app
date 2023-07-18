import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
import 'package:anime_ecommerce_app/screens/categories_list/category_list_screen.dart';
import 'package:anime_ecommerce_app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors.dart';
import '../../../data/lists.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: categoryNameList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: ((context) {
                //       CategoryListScreen(titleName: categoryNameList[index],)
                //     })));
                Get.to(() =>
                    CategoryListScreen(data: productsCollection,titleName: categoryNameList[index]),);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => CategoryListScreen(
                //               titleName: categoryNameList[index],
                //             ))));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 80, 70, 42),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Lottie.asset(catgeoryAssetsList[index])),
                    ),
                    Text(
                      categoryNameList[index],
                      style: const TextStyle(color: textWhiteColor),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}





