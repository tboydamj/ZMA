import 'package:firebase_auth/firebase_auth.dart';

import 'Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'dashboardPages/dashboard.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String _email;
  String _password;
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        //backgroundColor: Color.fromRGBO(255, 93, 13, 1),
        body: Center(child:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: isLoading
            ? Center(
              child: CircularProgressIndicator(),
            ):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                    1.2,
                    Text(
                      "Login",
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
                                  _email=value;
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
                                  _password=value;
                                });
                              },
                              obscureText: true,
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
                        setState(() {
                          isLoading = true;
                        });
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((user) {
                              setState(() {
                                isLoading = false;
                              });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DashBoard()));
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
                          "Login",
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
                      onTap: () => navigateToSignUp(context),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue[800]),
                        child: Center(
                          child: Text(
                            "SignUp",
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

  Future navigateToSignUp(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}
