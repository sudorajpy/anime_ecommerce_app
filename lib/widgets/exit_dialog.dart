import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Confirm Exit',style: TextStyle(fontSize: 18,color: Colors.black),),
          const Divider(),
          const Text('Are you sure you want to exit?',style: TextStyle(fontSize: 16,color: Colors.black),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){
                SystemNavigator.pop();
              }, child: const Text('Yes',style: TextStyle(fontSize: 16,color: Colors.black),)),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('No',style: TextStyle(fontSize: 16,color: Colors.black),)),
            ],
          )
        ],
      ),
    ),
  );
}
