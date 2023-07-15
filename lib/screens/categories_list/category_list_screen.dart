import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key, required this.titleName});

  final String? titleName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titleName!),
        ),
        body: Container(
          child: Column(children: [
            Expanded(
                child: Container(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: Image.asset('assets/images/ace_fs1.png',fit: BoxFit.cover,)),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Column(
                                
                                children: [
                                  Row(
                                    children: [
                                      Text('Item Name'),
                                      Spacer(),
                                      Icon(Icons.favorite)
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: Text('price',textAlign: TextAlign.start,))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ))
          ]),
        ));
  }
}

List<Color> containerClr = [
  Colors.black,
  const Color.fromARGB(255, 139, 50, 50),
  const Color.fromARGB(255, 76, 92, 4),
  const Color.fromARGB(255, 40, 125, 56),
  const Color.fromARGB(255, 191, 167, 57),
  const Color.fromARGB(255, 191, 80, 111),
  const Color.fromARGB(255, 82, 80, 189),
  const Color.fromARGB(255, 120, 159, 41),
  const Color.fromARGB(255, 15, 38, 186),
  const Color.fromARGB(255, 173, 27, 108),
];

// GridView.builder(
//           // physics: NeverScrollableScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           itemCount: 10,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//           ),
//           itemBuilder: (context, index) {
//             return Container(
//               height: 100,
//               width: 100,
//               color: containerClr[index],
//             );
//           }),
