import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 70),
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Surya',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(thickness: 1.2),
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
