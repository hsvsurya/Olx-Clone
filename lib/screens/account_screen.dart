import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Widget settingsList(String title, String subtitle, IconData icon) {
    return InkWell(
      onTap: () {
        showOkAlertDialog(
          context: context,
          okLabel: 'Ok',
          title: 'Cannot Change',
          message: 'You cannot change or view settings.',
        );
      },
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ),
    );
  }

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
                    onPressed: () {
                      showOkAlertDialog(
                        context: context,
                        okLabel: 'Ok',
                        title: 'Cannot Change',
                        message: 'You cannot change or view settings.',
                      );
                    },
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
          settingsList(
            'Buy Packages and My Orders',
            'Packages,orders,billing and invoices',
            Icons.credit_card,
          ),
          settingsList(
            'Settings',
            'Privacy and logout',
            Icons.settings,
          ),
          InkWell(
            onTap: () {
              showOkAlertDialog(
                context: context,
                okLabel: 'Ok',
                title: 'Cannot Change',
                message: 'You cannot change or view settings.',
              );
            },
            child: ListTile(
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
          ),
          settingsList(
            'Select Language',
            'English',
            Icons.language,
          ),
        ],
      ),
    );
  }
}
