
import 'package:flutter/material.dart';

import '../constants/colors.dart';

  Widget customeTextField({required String hintText, required TextInputType keyboardType,  controller}) {
    return ConstrainedBox(
      
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.green, fontSize: 18),
        keyboardType:keyboardType ,
        decoration: InputDecoration(
              border: OutlineInputBorder(
                 borderSide: const BorderSide(color: gradient1),
                 borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              
            ),
      ),
    );
  }

