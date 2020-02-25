import 'package:flutter/material.dart';
import 'package:flutter_login_screen/dashboardPages/car_list.dart';
import 'package:flutter_login_screen/dashboardPages/profile_details.dart';

class CarProfile extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarProfileState();
  }

}

class CarProfileState extends State<CarProfile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:ListView(
      children: <Widget>[
        /*Stack(
          children: <Widget>[
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0),),
                color: Colors.purpleAccent
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 35.0, left: 20.0),
                child: Text('My Cars With Zoomed', style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)
            )
          ],
        ),*/
        SizedBox(height: 20,),
        Container(
          height: MediaQuery.of(context).size.height - 400,
          child: CarList(),
        )
      ],
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateToProfileDetails(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Future navigateToProfileDetails(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileDetail()));
  }

}