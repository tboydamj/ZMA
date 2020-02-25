import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class CarCodes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarCodesState();
  }
}

class _CarCodesState extends State<CarCodes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            MyMenu(title: 'Activate', icon: Icons.power_settings_new, iconColor: Colors.green,),
            MyMenu(title: 'Shutdown', icon: Icons.stop, iconColor: Colors.red,),
            MyMenu(title: 'Locate', icon: Icons.search, iconColor: Colors.blue,),
            MyMenu(title: 'Set Admin', icon: Icons.person_add, iconColor: Colors.green,),
            MyMenu(title: 'Delete Admin', icon: Icons.person, iconColor: Colors.red,),
            MyMenu(title: 'Monitor', icon: Icons.fullscreen, iconColor: Colors.purple,),
          ],
        )
    );
  }
}



class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.iconColor});

  final String title;
  final IconData icon;
  final MaterialColor iconColor;
  final TextEditingController textEditingController = new TextEditingController();
  final List<String> commands = ['*126#', '*123#', '*205#', '*122#', '*222#'];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _showSnackBar(String message){
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message),
      action: SnackBarAction(
        label: 'ok',
        onPressed: () => _scaffoldKey.currentState.removeCurrentSnackBar(),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Send Code'),
                content: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(hintText: "Enter Phone number"),
                  keyboardType: TextInputType.number,
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: (){
                        for(int i = 0; i <= commands.length - 1; i++){
                          _sendInstantSMS(textEditingController.text, commands[i]);
                        }
                        receiver();
                      },
                      child: Text('Send'))
                ],
              )
          );
        },
        splashColor: Colors.purple,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 40.0,
                color: iconColor,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getEnteredNumber(){
    return textEditingController.text;
  }

  void _sendInstantSMS(String number, String code) {
    SmsSender sender = new SmsSender();
    String address = number;
    SmsMessage message = new SmsMessage(address, code);
    message.onStateChanged.listen((state){
      if(state == SmsMessageState.Sent){
        print("SMS is sent");
        _showSnackBar("Message sent successfully");
      }else if (state == SmsMessageState.Delivered){
        print("SMS is delivered");

      }
    });
    sender.sendSms(message);
  }

  void receiver(){
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) => _showSnackBar(msg.body));
  }

}
