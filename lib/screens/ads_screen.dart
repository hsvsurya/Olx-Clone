import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:olx_clone/screens/product_detail_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<ProductData> _favourites;
  int length = 0;

  @override
  void initState() {
    _favourites = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.isFav) {
          _favourites.add(e);

          //NOTE - removes the duplicates in the favourite screen
          _favourites = LinkedHashSet<ProductData>.from(_favourites).toList();
        } else {
          _favourites.remove(e);
        }
      }).toList();
    });

    length = _favourites.length;
    return Scaffold(
      body: _favourites.isEmpty
          ? Center(
              child: Text(
                'Currently there are no favourites\nplease add some',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: GridView.builder(
                itemCount: length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 3.9,
                ),
                itemBuilder: (_, int ind) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        PageTransition(
                          child: ProductDetailScreen(
                            index: _favourites[ind].id,
                          ),
                          type: ind % 2 == 0
                              ? PageTransitionType.leftToRight
                              : PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                        ),
                      )
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  _favourites[ind].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                padding: EdgeInsets.only(top: 10, right: 8),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: _favourites[ind].isFav
                                        ? Icon(Icons.favorite,
                                            color: Colors.pink)
                                        : Icon(Icons.favorite_border),
                                    onPressed: () {
                                      setState(() {
                                        length = _favourites.length;
                                        _favourites[ind].isFav =
                                            !_favourites[ind].isFav;
                                      });
                                    },
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 18, left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _favourites[ind].price,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 10, left: 5),
                            child: Text(_favourites[ind].productName),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black45,
                                ),
                                Text(
                                  _favourites[ind].location,
                                  style: TextStyle(color: Colors.black45),
                                ),
                                // Text('${_favourites.length}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
