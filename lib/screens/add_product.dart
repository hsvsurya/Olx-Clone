import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_clone/Models/products.dart';
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

  List<String> usageValues = [
    'Days',
    'Months',
    'Years',
  ];

  String usageValue;

  List<String> values = [
    'Olx Cars',
    'Properties',
    'Mobiles',
    'Jobs',
    'Bikes',
    'Electronics',
    'Vehicles and spares',
    'Furniture',
    'Fashion',
    'Sports,Books & Hobbies',
    'Pets',
    'Services',
  ];

  List<DropdownMenuItem> items = [];

  List<DropdownMenuItem> usageItems = [];

  Category value = Category.olx_cars;

  @override
  void initState() {
    super.initState();
    items = [
      DropdownMenuItem(
        child: Text('Olx Cars'),
        value: Category.olx_cars,
      ),
      DropdownMenuItem(
        child: Text('Properties'),
        value: Category.properties,
      ),
      DropdownMenuItem(
        child: Text('Mobiles'),
        value: Category.mobiles,
      ),
      DropdownMenuItem(
        child: Text('Jobs'),
        value: Category.jobs,
      ),
      DropdownMenuItem(
        child: Text('Bikes'),
        value: Category.bikes,
      ),
      DropdownMenuItem(
        child: Text('Electronics'),
        value: Category.electronics,
      ),
      DropdownMenuItem(
        child: Text('Vehicles and spares'),
        value: Category.vehicle_spares,
      ),
      DropdownMenuItem(
        child: Text('Furniture'),
        value: Category.furniture,
      ),
      DropdownMenuItem(
        child: Text('Fashion'),
        value: Category.fashion,
      ),
      DropdownMenuItem(
        child: Text('Sports,Books & Hobbies'),
        value: Category.sports_books_hobbies,
      ),
      DropdownMenuItem(
        child: Text('Pets'),
        value: Category.pets,
      ),
      DropdownMenuItem(
        child: Text('Services'),
        value: Category.services,
      ),
    ];

    usageItems = [
      DropdownMenuItem(
        child: Text('Days'),
        value: usageValues[0],
      ),
      DropdownMenuItem(
        child: Text('Months'),
        value: usageValues[1],
      ),
      DropdownMenuItem(
        child: Text('Years'),
        value: usageValues[2],
      ),
    ];

    usageValue = usageValues[0];
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Widget textField(
      String label, String hint, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        keyboardType: label == 'Price' || label == 'Usage'
            ? TextInputType.number
            : TextInputType.name,
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);

    // NOTE - Adding product

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
          usage: '${_usage.text} $usageValue',
          model: _model.text,
          brand: _brand.text,
          desc: _desc.text,
          location: _location.text,
          price: _price.text,
          productName: _productName.text,
          value: value,
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
                left: 10,
                // right: 10,
                bottom: 16,
                top: 10,
              ),
              width: 200,
              height: _image != null
                  ? MediaQuery.of(context).size.height / 3.660
                  : 80,
              child: _image != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: getImage,
                          child: Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )
                  : TextButton.icon(
                      onPressed: getImage,
                      icon: Icon(Icons.add_a_photo_outlined),
                      label: Text('Add Image'),
                    ),
            ),
            textField('Product Name', '', _productName),
            textField('Price', '₹ xxx', _price),
            textField('Location', 'Place,State', _location),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                maxLines: 3,
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
            textField('Brand', '', _brand),
            textField('Model', '', _model),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(20),
                    child: textField('Usage', '', _usage)),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButton(
                    items: usageItems,
                    value: usageValue,
                    onChanged: (value) {
                      setState(() {
                        usageValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                child: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  items: items,
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: ElevatedButton(
                  onPressed: addProduct,
                  child: Text('Submit'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                  ),
                  Text(
                    'To change/replace the image plese \nclick on the image if selected',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
