import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneme/screens/shop_home_profile_page.dart';
import 'about.dart';
import 'myaccount.dart';
import 'myorders.dart';
class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}
late User _currentUser ;
class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              MaterialPageRoute(
                builder: (context) => ProfilePage(user : _currentUser),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'My Account',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 19.0),
          ),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}