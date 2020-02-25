import 'package:flutter/material.dart';
import 'package:flutter_login_screen/dashboardPages/profile_details.dart';
import 'package:flutter_login_screen/database/car_dao.dart';
import 'package:flutter_login_screen/database/car_model.dart';

class CarList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarListState();
  }
}

class CarListState extends State<CarList> {
  List<Car> carDetails;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return ListView(
      children: <Widget>[
        _buildCarCard('images/vintage_chervolet.png', 'Nissan', '01', '683448274'),
        _buildCarCard('images/default_image.png', 'Toyota', '02', '683448274'),
        _buildCarCard('images/vintage_chervolet.png', 'Fortuner', '03', '683448274'),
        _buildCarCard('images/default_image.png', 'Nissan', '04', '683448274'),
      ],
      scrollDirection: Axis.horizontal,
    );*/
    if (carDetails == null) {
      carDetails = List<Car>();
      CarDao().getAllSortedByRegNum().then((value) {
        setState(() {
          this.carDetails = value;
        });
      });
    }

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: carDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCarCard(
              'images/vintage_chervolet.png',
              carDetails[index].model,
              carDetails[index].regNum,
              carDetails[index].phone);
        });
  }

  _buildCarCard(
      String imgPath, String carName, String regNum, String phoneNum) {
    return GestureDetector(
       onTap: (){

       },
        child: Padding(
      padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 3.0,
                  spreadRadius: 3.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                      height: 100.0,
                      width: 100.0,
                    ))
              ],
            ),
            Container(
              width: 125.0,
              padding: EdgeInsets.only(left: 10.0, top: 20.0),
              child: Text(
                carName,
                style: TextStyle(color: Colors.purple, fontSize: 15.0),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                phoneNum,
                style: TextStyle(color: Color(0xFF440206)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.directions_car,
                    color: Colors.purple,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    regNum,
                    style: TextStyle(fontSize: 6.0, color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future navigateToProfileDetails(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileDetail()));
  }
}
