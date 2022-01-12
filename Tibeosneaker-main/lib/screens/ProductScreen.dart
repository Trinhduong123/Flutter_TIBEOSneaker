import 'package:flutter/material.dart';
import 'package:oneme/screens/shop_home_profile_page.dart';
import '../ProductModel.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;

  ProductScreen(this._valueSetter);

  List<ProductModel> products = [
    ProductModel("Nike Air Force 1 ", 245,"https://cafedidong.vn/wp-content/uploads/2020/04/nike-air-force-1-4.jpg?width=70&quality=90"),
    ProductModel("Jordan 5 Chinese New Year", 905,"https://shoegameviet.com/data/uploads/shoes/air-jordan-5/retro/black-bright-crimson-beta-blue-black-low-1.png?width=70&quality=90"),
    ProductModel("Air Jordan 5 Retro Fierce Purple", 845,"https://shoegameviet.com/data/uploads/shoes/air-jordan-5/gs/440892-017-1.png?width=70&quality=90"),
    ProductModel("Air Jordan 1 Retro High OG Hand Crafted", 300,"https://shoegameviet.com/data/uploads/items/2021/12/03/DH3097-001-1.jpeg?width70&quality=90"),
    ProductModel("New Balance 990v3", 500,"https://shoegameviet.com/data/uploads/shoes/new-balance/new-balance-990v3/2021/10/M990VS3-2.jpg?width=70&quality=90"),
    ProductModel("Ultra Boost 20 Grey Two Signal Coral", 349,"https://shoegameviet.com/data/uploads/shoes/adidas/ultraboost/20/2020/EG0719-2.jpg?width=70&quality=90"),
    ProductModel("Yeezy Boost 350 V2 MX Oat", 299,"https://shoegameviet.com/data/uploads/items/2021/10/GW3773-2.jpeg?width=70&quality=90"),
    ProductModel("Yeezy Boost 500 Taupe Light", 349,"https://shoegameviet.com/data/uploads/shoes/yeezy/500/2021/GX3605-3.jpeg?width=70&quality=90"),
    ProductModel("Air Jordan 1 Retro High Travis Scott", 15,"https://cdn.shoegameviet.com/uploads/shoes/air-jordan-1/retro/sail-black-dark-mocha.png?width=70&quality=90"),
    ProductModel("Ultra 4D Miami Hurricanes", 549,"https://shoegameviet.com/data/uploads/items/2021/12/04/Q46439-3.jpg?width=70&quality=90"),
    ProductModel(" NMD Hu Pharrell x Billionaire", 239,"https://shoegameviet.com/data/uploads/items/2021/12/04/GW3955-3.jpg?width=70&quality=90"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Padding(
      padding: EdgeInsets.fromLTRB(0,300,0,0),
      child:ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: IconButton(icon:Icon(Icons.add_shopping_cart,color: Color.fromARGB(
                143, 0, 0, 0),), onPressed: () {
              _valueSetter(products[index]);
            },),
            subtitle: Text(
              "\$${products[index].price}",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                height: 2,
              ),
            ),
            leading: Image.network(products[index].url,
              height: 70.0,
              width: 70.0,
            ),

            onTap: () {
            },
          );
        },

        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: products.length),
      ),
    );
  }
}
