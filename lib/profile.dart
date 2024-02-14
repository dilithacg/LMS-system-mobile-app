import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Icon(
            Icons.account_circle_rounded,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 20.0),
          Text(
            'Pasindu',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          Text(
            '458964@plymouth.ac.uk',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          SizedBox(height: 30.0),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
await preferences.clear();
   Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()),
                        );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
