import 'package:flutter/material.dart';
import 'package:flutter_login_screen/dashboardPages/profile.dart';
import 'package:flutter_login_screen/database/car_model.dart';
import 'package:flutter_login_screen/database/car_dao.dart';

class ProfileDetail extends StatefulWidget{
  ProfileDetail({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileDetailState();
  }

}

class ProfileDetailState extends State<ProfileDetail>{

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController regNumController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController driverController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Car With Zoomed'),
      ),
      body: SafeArea(
        top: false,
          bottom: false,
          child: Form(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Enter the cars phone number',
                      labelText: 'Phone'
                    ),
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.confirmation_number),
                      hintText: 'Registration Number',
                      labelText: 'Reg Number'
                    ),
                    controller: regNumController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.drive_eta),
                      hintText: 'Model Ex: Toyota Carina E',
                      labelText: 'Model'
                    ),
                    controller: modelController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Name Of Driver',
                      labelText: 'Driver'
                    ),
                    controller: driverController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Enter Numeric Password',
                      labelText: 'Password'
                    ),
                    keyboardType: TextInputType.number,
                    controller: passwordController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child:Row(
                    children: <Widget>[
                      Expanded(child:RaisedButton(
                        onPressed: (){
                          CarDao().insert(Car(
                              phone: phoneController.text,
                              regNum: regNumController.text,
                              model: modelController.text,
                              driver: driverController.text,
                              password: passwordController.text));
                          navigateToCarProfile(context);
                        },
                        color: Colors.green,
                        child: Text('Submit', style: TextStyle(
                            color: Colors.white),)
                      )),
                      SizedBox(
                        width: 4.0,
                      ),
                      Expanded(child:RaisedButton(
                          child: Text('Clear', style: TextStyle(
                            color: Colors.white
                          ),),
                          color: Colors.red,
                          onPressed: (){
                            setState(() {
                              phoneController.clear();
                              regNumController.clear();
                              modelController.clear();
                              driverController.clear();
                              passwordController.clear();
                            });
                          }))
                    ],
                  ))
                ],
              )))
    );
  }

  Future navigateToCarProfile(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CarProfile()));
  }

}