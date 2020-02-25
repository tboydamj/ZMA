import 'package:flutter_login_screen/services/usermanagement.dart';

import 'Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'dashboardPages/dashboard.dart';
import 'LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        //backgroundColor: Color.fromRGBO(255, 93, 13, 1),
        body:
            Center(child:SingleChildScrollView(child:
        Container(
          padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                    1.2,
                    Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 30,
                ),
                  FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[300]))),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  hintText: "Email or Phone number"),
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  hintText: "Password"),
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                    1.8,
                    Center(
                        child: InkWell(
                      onTap: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((signedInUser) {
                          UserManagement().storeNewUser(signedInUser.user, context);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoard()));
                        }).catchError((e) {
                          print(e);
                        });
                      },
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue[800]),
                        child: Center(
                            child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white.withOpacity(.7)),
                        )),
                      ),
                    ))),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.8,
                    Center(
                        child: InkWell(
                      onTap: () => navigateToLogin(context),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue[800]),
                        child: Center(
                          child: Text(
                            "Login",
                            style:
                                TextStyle(color: Colors.white.withOpacity(.7)),
                          ),
                        ),
                      ),
                    )))
              ],
            ),
          ),
        )));
  }

  Future navigateToDashBoard(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashBoard()));
  }

  Future navigateToLogin(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
