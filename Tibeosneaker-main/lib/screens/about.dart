import'package:flutter/material.dart';


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'About',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 19.0),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child:
            Container(

                child: new Text('\t\t\t\tApp Developer :\nDuong Dinh Trinh ©',style: TextStyle(fontFamily: "OpenSans"),),
              ),

        ),
      ),
    );
  }
}