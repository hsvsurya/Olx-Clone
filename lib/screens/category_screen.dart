import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:olx_clone/Widgets/product_grid.dart';
import 'package:provider/provider.dart';

class PropertyScreen extends StatefulWidget {
  static const routeName = 'property-screen';
  @override
  _PropertyScreenState createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  List<ProductData> properties = [];
  @override
  Widget build(BuildContext context) {
    var property = Provider.of<Product>(context).product;
    setState(() {
      property.map((e) {
        if (e.category == Category.properties) {
          properties.add(e);
          properties = LinkedHashSet<ProductData>.from(properties).toList();
        } else {
          properties.remove(e);
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Properties',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: properties.isEmpty
          ? Center(
              child: Text(
                'Currently there are no properties \n           will notify you if they are any',
                style: TextStyle(fontSize: 19),
              ),
            )
          : ProductGrid(products: properties),
    );
  }
}

class OlxAutoCategory extends StatefulWidget {
  static const routeName = 'olxauto-screen';
  @override
  _OlxAutoCategoryState createState() => _OlxAutoCategoryState();
}

class _OlxAutoCategoryState extends State<OlxAutoCategory> {
  List<ProductData> olxAuto = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.olx_cars) {
          olxAuto.add(e);
          olxAuto = LinkedHashSet<ProductData>.from(olxAuto).toList();
        } else {
          olxAuto.remove(e);
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Olx Auto(Cars)',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: olxAuto.isEmpty
          ? Center(
              child: Text(
                ' Currently there are no Cabs\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
              ),
            )
          : ProductGrid(products: olxAuto),
    );
  }
}

class MobileCategory extends StatefulWidget {
  static const routeName = 'mobile-screen';
  @override
  _MobileCategoryState createState() => _MobileCategoryState();
}

class _MobileCategoryState extends State<MobileCategory> {
  List<ProductData> mobiles = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.mobiles) {
          mobiles.add(e);
          mobiles = LinkedHashSet<ProductData>.from(mobiles).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Mobiles',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: mobiles.isEmpty
          ? Center(
              child: Text(
                'Currently there are no mobiles\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: mobiles),
    );
  }
}

class JobsCategory extends StatefulWidget {
  static const routeName = 'job-screen';
  @override
  _JobsCategoryState createState() => _JobsCategoryState();
}

class _JobsCategoryState extends State<JobsCategory> {
  List<ProductData> jobs = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.jobs) {
          jobs.add(e);
          jobs = LinkedHashSet<ProductData>.from(jobs).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Jobs',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: jobs.isEmpty
          ? Center(
              child: Text(
                'Currently there are no jobs\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: jobs),
    );
  }
}

class BikesCategory extends StatefulWidget {
  static const routeName = 'bike-screen';
  @override
  _BikesCategoryState createState() => _BikesCategoryState();
}

class _BikesCategoryState extends State<BikesCategory> {
  List<ProductData> bikes = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.bikes) {
          bikes.add(e);
          bikes = LinkedHashSet<ProductData>.from(bikes).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Bikes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: bikes.isEmpty
          ? Center(
              child: Text(
                'Currently there are no bikes\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: bikes),
    );
  }
}

class ElectronicCategory extends StatefulWidget {
  static const routeName = 'electronic-screen';
  @override
  _ElectronicCategoryState createState() => _ElectronicCategoryState();
}

class _ElectronicCategoryState extends State<ElectronicCategory> {
  List<ProductData> electronics = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.electronics) {
          electronics.add(e);
          electronics = LinkedHashSet<ProductData>.from(electronics).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Electronics',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: electronics.isEmpty
          ? Center(
              child: Text(
                'Currently there are no electronics\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: electronics),
    );
  }
}

class VehicleSpareCategory extends StatefulWidget {
  static const routeName = 'vehicle-screen';
  @override
  _VehicleSpareCategoryState createState() => _VehicleSpareCategoryState();
}

class _VehicleSpareCategoryState extends State<VehicleSpareCategory> {
  List<ProductData> vehicleSpares = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.vehicle_spares) {
          vehicleSpares.add(e);
          vehicleSpares =
              LinkedHashSet<ProductData>.from(vehicleSpares).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Vehicles Spares',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: vehicleSpares.isEmpty
          ? Center(
              child: Text(
                'Currently there are no spares\n for vehicles will notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: vehicleSpares),
    );
  }
}

class FurnitureCategory extends StatefulWidget {
  static const routeName = 'furniture-screen';
  @override
  _FurnitureCategoryState createState() => _FurnitureCategoryState();
}

class _FurnitureCategoryState extends State<FurnitureCategory> {
  List<ProductData> furniture = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.furniture) {
          furniture.add(e);
          furniture = LinkedHashSet<ProductData>.from(furniture).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Furniture',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: furniture.isEmpty
          ? Center(
              child: Text(
                'Currently there are no furniture\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: furniture),
    );
  }
}

class FashionCategory extends StatefulWidget {
  static const routeName = 'fashion-screen';
  @override
  _FashionCategoryState createState() => _FashionCategoryState();
}

class _FashionCategoryState extends State<FashionCategory> {
  List<ProductData> fashion = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.fashion) {
          fashion.add(e);
          fashion = LinkedHashSet<ProductData>.from(fashion).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Fashion',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: fashion.isEmpty
          ? Center(
              child: Text(
                'Currently there are no fashion\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: fashion),
    );
  }
}

class SportsCategory extends StatefulWidget {
  static const routeName = 'sports-screen';
  @override
  _SportsCategoryState createState() => _SportsCategoryState();
}

class _SportsCategoryState extends State<SportsCategory> {
  List<ProductData> sports = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.sports_books_hobbies) {
          sports.add(e);
          sports = LinkedHashSet<ProductData>.from(sports).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Sports',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: sports.isEmpty
          ? Center(
              child: Text(
                'Currently there are no items available\n for sports/books will notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: sports),
    );
  }
}

class PetsCategory extends StatefulWidget {
  static const routeName = 'pets-screen';
  @override
  _PetsCategoryState createState() => _PetsCategoryState();
}

class _PetsCategoryState extends State<PetsCategory> {
  List<ProductData> pets = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.pets) {
          pets.add(e);
          pets = LinkedHashSet<ProductData>.from(pets).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Pets',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: pets.isEmpty
          ? Center(
              child: Text(
                'Currently there are no pets\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: pets),
    );
  }
}

class ServicesCategory extends StatefulWidget {
  static const routeName = 'services-screen';
  @override
  _ServicesCategoryState createState() => _ServicesCategoryState();
}

class _ServicesCategoryState extends State<ServicesCategory> {
  List<ProductData> services = [];
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;
    setState(() {
      productData.map((e) {
        if (e.category == Category.services) {
          services.add(e);
          services = LinkedHashSet<ProductData>.from(services).toList();
        }
      }).toList();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Services',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: services.isEmpty
          ? Center(
              child: Text(
                'Currently there are no services\nwill notify you if they are any',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            )
          : ProductGrid(products: services),
    );
  }
}
