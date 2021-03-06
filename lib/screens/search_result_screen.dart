import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'product_detail_screen.dart';
// import 'package:olx_clone/Models/products.dart';

class SearchResultScreen extends StatefulWidget {
  final List searchData;

  SearchResultScreen({this.searchData});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Search Items',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5, left: 4),
        child: GridView.builder(
          itemCount: widget.searchData.length,
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
                      index: widget.searchData[ind].id,
                    ),
                    type: ind % 2 == 0
                        ? PageTransitionType.leftToRight
                        : PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 300),
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
                          child: widget.searchData[ind].imageUrl
                                  .toString()
                                  .startsWith('http')
                              ? Image.network(
                                  widget.searchData[ind].imageUrl,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  widget.searchData[ind].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(top: 10, right: 8),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: widget.searchData[ind].isFav
                                  ? Icon(Icons.favorite, color: Colors.pink)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                setState(() {
                                  // _favourites.toSet().toList();

                                  // print(_favourites);
                                  // length = _favourites.length;
                                  widget.searchData[ind].isFav =
                                      !widget.searchData[ind].isFav;
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
                        widget.searchData[ind].price,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Text(widget.searchData[ind].productName),
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
                            widget.searchData[ind].location,
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
