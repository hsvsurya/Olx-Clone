import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:olx_clone/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = 'add-product';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController _productName = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _brand = TextEditingController();
  TextEditingController _model = TextEditingController();
  TextEditingController _usage = TextEditingController();
  TextEditingController _location = TextEditingController();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    HomeScreen homeScreen;

    void addProduct() {
      if (_productName != null &&
          _location != null &&
          _model != null &&
          _brand != null &&
          _image != null &&
          _desc != null &&
          _usage != null &&
          _price != null) {
        productData.addProduct(
          image: _image,
          usage: _usage.text,
          model: _model.text,
          brand: _brand.text,
          desc: _desc.text,
          location: _location.text,
          price: _price.text,
          productName: _productName.text,
        );
        Navigator.pop(context);
      } else {
        showOkAlertDialog(
          context: context,
          message: 'You cannot leave empty fields',
          title: 'Empty Value',
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        child: ListView(
          // padding: EdgeInsets.all(13),
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 3.4,
                  bottom: 16,
                  top: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: _image != null
                        ? MediaQuery.of(context).size.height / 3
                        : 50,
                    child: _image != null
                        ? Image.file(
                            _image,
                            fit: BoxFit.cover,
                          )
                        : TextButton.icon(
                            onPressed: getImage,
                            icon: Icon(Icons.add_a_photo_outlined),
                            label: Text('Add Image'),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _productName,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _price,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'Place,State',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _location,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _desc,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Brand',
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _brand,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Model',
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _model,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usage',
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _usage,
              ),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: addProduct,
                  child: Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
