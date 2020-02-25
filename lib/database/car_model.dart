import 'package:meta/meta.dart';

class Car{
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Fruit.

  int id;

  final String phone;
  final String regNum;
  final String model;
  final String driver;
  final String password;


  Car({
    @required this.phone,
    @required this.regNum,
    @required this.model,
    @required this.driver,
    @required this.password,
  });

  Map<String, dynamic> toMap(){
    return {
      'phone': phone,
      'regNum': regNum,
      'model': model,
      'driver': driver,
      'password': password
    };
  }

  static Car fromMap(Map<String, dynamic> map){
    return Car(
      phone: map['phone'],
      regNum: map['regNum'],
      model: map['model'],
      driver: map['driver'],
      password: map['password']
    );
  }
}
