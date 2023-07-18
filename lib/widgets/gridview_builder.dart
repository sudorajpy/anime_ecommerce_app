import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class GridViewBuilder extends StatelessWidget {
  GridViewBuilder({
    super.key,
    required this.scrollPhysics,
    required this.itemCount,
  });
  final ScrollPhysics scrollPhysics;
  final int itemCount;
  // Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        //
        physics: scrollPhysics,
        // physics: BouncingScrollPhysics(),
        // scrollDirection: scrollDirection,
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(border: Border.all(color: gradient2)),
            child: Column(
              children: [
                Container(
                    height: 140,
                    child: Image.network(
                      'assets/images/ace_fs1.png',
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text('Item Name'),
                            Spacer(),
                            LikeButton()
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            child: const Text(
                              'price',
                              textAlign: TextAlign.start,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
