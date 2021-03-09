import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final int index;
  ProductDetailScreen({this.index});
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '${productData[widget.index].productName}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1,
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  child: Center(
                    child: Image.network(
                      '${productData[widget.index].imageUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 10, right: 8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: productData[widget.index].isFav
                          ? Icon(Icons.favorite, color: Colors.pink)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        setState(() {
                          productData[widget.index].isFav =
                              !productData[widget.index].isFav;
                        });
                      },
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 18, left: 20),
            child: Text(
              '${productData[widget.index].price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 19, left: 20),
            child: Text(
              'Details',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 50),
            child: Text(
              'Brand\t\t\t\t :\t\t\t\t\t\t  ${productData[widget.index].productDetailData.brand}',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 19, left: 50),
            child: Text(
              'Model\t\t\t\t :\t\t\t\t\t\t  ${productData[widget.index].productDetailData.model}',
              style: TextStyle(fontSize: 15),
            ),
          ),
          productData[widget.index].productDetailData.usage == null
              ? Text('')
              : Container(
                  padding: EdgeInsets.only(top: 19, left: 50),
                  child: Text(
                    'Usage\t\t\t\t :\t\t\t\t\t\t  ${productData[widget.index].productDetailData.usage}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
          Container(
            padding: EdgeInsets.only(top: 19, left: 20),
            child: Text(
              'Description',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 50, bottom: 30),
            child: Text(
              '${productData[widget.index].desc}',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 3,
        child: Row(
          children: [
            Container(
              height: 69,
              width: MediaQuery.of(context).size.width / 2.1,
              padding: EdgeInsets.only(left: 18, bottom: 10, top: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 9, 49, 64),
                  ),
                  icon: Icon(
                    Icons.messenger_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Chat',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              height: 69,
              width: MediaQuery.of(context).size.width / 2.1,
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 9, 49, 64),
                  ),
                  icon: Icon(
                    Icons.phone_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Call',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
