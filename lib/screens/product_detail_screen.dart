import 'package:flutter/material.dart';
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
    return Scaffold(body: SliverAppBar());
  }
}
