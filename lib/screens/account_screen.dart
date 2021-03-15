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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Hsvsurya',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View and edit profile',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(thickness: 1.2),
          ListTile(
            title: Text('Buy Packages and My Orders'),
            subtitle: Text('Packages,orders,billing and invoices'),
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
              size: 30,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Settings'),
            subtitle: Text('Privacy and logout'),
            leading: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Help and Support'),
            subtitle: Text('Help Center and legal terms'),
            leading: Text(
              'Olx',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Select Language'),
            subtitle: Text('English'),
            leading: Icon(
              Icons.language,
              color: Colors.black,
              size: 30,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
