
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../constants/colors.dart';

  Widget customeTextField({required String hintText, required TextInputType keyboardType,  controller, Icon? icon, String? labelText}) {
    return ConstrainedBox(
      
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: textWhiteColor, fontSize: 18),
        keyboardType:keyboardType ,
        decoration: InputDecoration(
              border: OutlineInputBorder(
                 borderSide: const BorderSide(color: gradient1),
                 borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.white),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              
              // icon: Icon(Icons.person, color: gradient1,),
              prefixIcon: icon,
            ),
      ),
    );
  }





  

