import 'package:flutter/material.dart';

class AppSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppSettingState();
  }

}

class _AppSettingState extends State<AppSetting>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child:
    ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Languages'),
          ),
          Divider(height: 15,),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
          Divider(height: 15,),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share')
          ),
          Divider(height: 15,),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Zoomed FAQ'),
          ),
          Divider(height: 15,),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Sync')
          ),
          Divider(height: 15,),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Update'),
          )
        ],
      ));
  }

}