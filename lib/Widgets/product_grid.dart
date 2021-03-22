import 'package:flutter/material.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:olx_clone/screens/product_detail_screen.dart';
import 'package:page_transition/page_transition.dart';

class ProductGrid extends StatefulWidget {
  final List<ProductData> products;

  ProductGrid({this.products});

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: GridView.builder(
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 3.9,
        ),
        itemBuilder: (_, int ind) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: ProductDetailScreen(
                    index: widget.products[ind].id,
                  ),
                  type: PageTransitionType.leftToRight,
                ),
              );
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
                          widget.products[ind].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top: 10, right: 8),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: widget.products[ind].isFav
                                ? Icon(Icons.favorite, color: Colors.pink)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                // length = properties.length;
                                widget.products[ind].isFav =
                                    !widget.products[ind].isFav;
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
                      widget.products[ind].price,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 10, left: 5),
                    child: Text(widget.products[ind].productName),
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
                          widget.products[ind].location,
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
    );
  }
}
