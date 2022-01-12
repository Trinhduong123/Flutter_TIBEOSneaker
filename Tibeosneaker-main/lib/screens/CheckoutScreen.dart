import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oneme/main.dart';
import 'package:oneme/screens/shop_home_profile_page.dart';

class CheckoutScreen extends StatefulWidget {
  final cart;
  var sum;
  final user;

  CheckoutScreen(this.cart, this.sum,this.user);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}
late User _currentUser  ;
class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              MaterialPageRoute(
                  builder: (context) => ProfilePage(user: _currentUser,),
              );
            },
          ),
          title:Text('Giỏ hàng',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),

          backgroundColor: Color.fromARGB(255, 1, 62, 78),
          actions: [
           FlatButton(
               onPressed: (){},
               child: Text("Total : \$${widget.sum }",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontFamily: 'OpenSans',
                   fontSize: 18.0,
                   color: Colors.white
                 ),
               ),
           ),

          ],
        ),
        body: Stack(

      children: <Widget>[
            ListView.separated(
              padding: EdgeInsets.only(top: 5 , bottom: 70),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.cart[index].name),
                  trailing: IconButton(icon:Icon(Icons.remove_circle,color: Colors.red,), onPressed: () {
                    widget.sum = widget.sum - widget.cart[index].price;

                    widget.cart.remove(widget.cart[index]);
                    setState(() {
                    });
                  },),
                  leading: Image.network(widget.cart[index].url,
                    height: 70.0,
                    width: 70.0,
                  ),
                  subtitle: Text(
                    "\$${widget.cart[index].price}",
                    style: TextStyle(
                        color: Color.fromARGB(144, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: widget.cart.length,
              shrinkWrap: true,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:Container(
               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                width:double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    MaterialPageRoute(
                      builder: (context) =>ProfilePage(user : widget.user,),
                    );
                  },
                  child: Text('Buy \$${widget.sum }',
                    style: TextStyle(fontSize: 18.0,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),),
                  style:ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Color.fromARGB(255, 1, 62, 78),onPrimary: Colors.white),
                ),
              ),
            ),
      ],
    ),

    ),

    );
  }
}
