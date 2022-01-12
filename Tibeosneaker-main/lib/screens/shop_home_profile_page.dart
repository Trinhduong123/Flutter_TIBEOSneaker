import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oneme/screens/allcategories.dart';
import 'package:oneme/screens/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:oneme/ProductModel.dart';
import 'package:oneme/screens/CheckoutScreen.dart';
import 'package:oneme/screens/ProductScreen.dart';
import 'package:oneme/screens/wishlist.dart';

import 'about.dart';
import 'myaccount.dart';
import 'myorders.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset("images/logo.png",height: 35, width: 35, color: Colors.white,),
            Text(
              "TIBEO",
              style:
              TextStyle(color: Color.fromARGB(255, 236, 209, 30), fontWeight: FontWeight.w800,fontSize: 20),
            ),
            Text(
              "S",
              style: TextStyle(color: Color.fromARGB(248, 250, 22, 22), fontWeight: FontWeight.w900,fontSize: 20),
            ),
            Text(
              "neakers",
              style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w500,fontSize: 20),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(205, 0, 0, 0),
        actions: [

          IconButton(
            padding: EdgeInsets.only(right: 1.0,left: 1.0),
            icon: Icon(Icons.shopping_cart_outlined,),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(cart, sum,_currentUser),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(

                cart.length.toString(),

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
            ),
          ),
          _isSigningOut
              ? CircularProgressIndicator()
              : IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await FirebaseAuth.instance.signOut();
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'NAME:\t ${_currentUser.displayName}',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'EMAIL:\t ${_currentUser.email}',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "You",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://znews-photo.zadn.vn/w660/Uploaded/lerl/2017_03_13/ha_giang_zing_6.jpg'
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "All Categories",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.category,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllCategories(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "Cart",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(Icons.shopping_cart_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(cart, sum,_currentUser),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "Wishlist",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.add_circle_outline_outlined,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WishList(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "My Orders",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.bookmarks_outlined,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyOrders(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "My account",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.person_pin,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyAccount(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "About",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.info_outline,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Legal",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
              children: [
                CarouselSlider(
                  items: [

                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/post1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/post2.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/post3.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/banner1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),



                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
          ),

          ProductScreen((selectedProduct) {
            setState(() {
              cart.add(selectedProduct);
              sum = 0;
              cart.forEach((item) {
                sum = sum + item.price;
              });
            });
          }),

          Padding(
            padding: const EdgeInsets.only(top: 200,left: 20,right:20,bottom: 450),

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                child: Column(
                    children:<Widget> [
                      Text("Nike",
                            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("https://cdn-icons-png.flaticon.com/512/732/732084.png?quality=90",width: 70, height: 40,
                      ),
                    ],

                  mainAxisAlignment: MainAxisAlignment.center,
                 ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  height: 40,
                  width: 70,
                ),
                Container(
                  child: Column(
                    children:<Widget> [
                      Text("Adidas",
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("https://cdn.iconscout.com/icon/free/png-256/adidas-3421616-2854297.png?quality=90",width: 70, height: 40,
                      ),
                    ],

                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  height: 40,
                  width: 70,
                ),
                Container(
                  child: Column(
                    children:<Widget> [
                      Text("Balenciaga",
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("https://cdn.iconscout.com/icon/free/png-256/balenciaga-3421544-2854225.png?quality=90",width: 70, height: 40,
                      ),
                    ],

                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  height: 40,
                  width: 100,
                ),
                Container(
                  child: Column(
                    children:<Widget> [
                      Text("Yeezy",
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("http://cdn.onlinewebfonts.com/svg/img_473631.png?quality=90",width: 70, height: 40,
                      ),
                    ],

                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                ),
                Container(
                  child: Column(
                    children:<Widget> [
                      Text("New Balance",
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("https://i.pinimg.com/originals/9b/60/c3/9b60c3986614a3fc5dd0c98b6c9d7653.png?quality=90",width: 70, height: 40,
                      ),
                    ],

                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  height: 40,
                  width: 130,
                ),
                Container(
                  child: Column(
                    children:<Widget> [
                      Text("Jordan",
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("https://i.pinimg.com/474x/b8/00/e6/b800e6fe8acbb41e9d9d94c21dae26dc.jpg?quality=90",width: 70, height: 40,
                      ),
                    ],

                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  height: 40,
                  width: 100,
                ),
                Container(
                  child: Column(
                    children:<Widget> [
                      Text("Nike",
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 20)
                      ),
                      Image.network("https://cdn-icons-png.flaticon.com/512/732/732084.png?quality=90",width: 70, height: 40,
                      ),
                    ],

                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  height: 40,
                  width: 100,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}

