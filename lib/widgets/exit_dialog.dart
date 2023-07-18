import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Confirm Exit',style: TextStyle(fontSize: 18,color: Colors.black),),
          Divider(),
          Text('Are you sure you want to exit?',style: TextStyle(fontSize: 16,color: Colors.black),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){
                SystemNavigator.pop();
              }, child: Text('Yes',style: TextStyle(fontSize: 16,color: Colors.black),)),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No',style: TextStyle(fontSize: 16,color: Colors.black),)),
            ],
          )
        ],
      ),
    ),
  );
}
