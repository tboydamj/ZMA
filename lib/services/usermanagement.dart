import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_screen/dashboardPages/dashboard.dart';

class UserManagement{

  storeNewUser(user, context){
    Firestore.instance.collection('/users')
        .add({
      'email': user.email,
      'uid': user.uid,
    }).then((value){
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoard()));
    }).catchError((e) {
          print(e);
    });
  }
}