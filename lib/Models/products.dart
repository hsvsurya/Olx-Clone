import 'package:flutter/material.dart';

class ProductDetailData {
  final String brand;
  final String model;
  final String usage;
  ProductDetailData({this.brand, this.model, this.usage});
}

class ProductData {
  final String imageUrl;
  final String desc;
  final String price;
  bool isFav;
  final String location;
  final bool sellingStatus;
  final String productName;
  final ProductDetailData productDetailData;

  ProductData({
    this.desc,
    this.imageUrl,
    this.isFav,
    this.location,
    this.price,
    this.productName,
    this.sellingStatus,
    this.productDetailData,
  });
}

class Product extends ChangeNotifier {
  List<ProductData> product = [
    ProductData(
      imageUrl:
          'https://c.ndtvimg.com/2021-02/knlqli88_perseverancemarspicsafp_625x300_20_February_21.jpg',
      desc: 'Mars is for sale book yours now',
      productName: 'Mars',
      isFav: false,
      location: 'Mars',
      price: '₹ 1,00,000',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Mars', model: 'Red Planet', usage: '0 days'),
    ),
    ProductData(
      imageUrl:
          'https://previews.123rf.com/images/nadyanadal/nadyanadal1707/nadyanadal170700017/82928123-men-s-shirts-set-folded-on-a-white-background-.jpg',
      desc: '3 Shirts which are unused',
      productName: 'Shirts',
      isFav: false,
      location: 'Bangalore,Karnataka',
      price: '₹ 1,000/pc',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Parx', model: 'Retro style full hands', usage: '2 Days'),
    ),
    ProductData(
      imageUrl:
          'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      desc: 'Sliver ringed bracelet and Black round watch',
      productName: 'Watch',
      isFav: false,
      location: 'Chennai,Tamil Nadu',
      price: '₹ 2,500',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Titan',
          model: 'Workwear Watch with Anthracite Dial & Metal Strap',
          usage: '3 Months'),
    ),
    ProductData(
      imageUrl:
          'https://images.pexels.com/photos/47261/pexels-photo-47261.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      desc:
          'Samsung galaxy s7 edge which is moderately used and is in good condition',
      productName: 'Samsung galaxy s7 edge',
      isFav: false,
      location: 'Mumbai,Maharashtra',
      price: '₹ 20,000',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Samsung', model: 'Galaxy s7 edge', usage: '1 Year'),
    ),
    ProductData(
      imageUrl:
          'https://images.pexels.com/photos/2349209/pexels-photo-2349209.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      desc: 'Dell laptop for sale which is in good condition',
      productName: 'Dell laptop',
      isFav: false,
      location: 'Cuttak,Odisha',
      price: '₹ 40,000',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Dell', model: 'Vostro 5042', usage: '2 Weeks'),
    ),
    ProductData(
      imageUrl:
          'https://images.pexels.com/photos/276528/pexels-photo-276528.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      desc: 'Sofa set without single repair for sale',
      productName: 'Beige 3 sofa set',
      isFav: false,
      location: 'Vizag,Andhra Pradesh',
      price: '₹ 72,000',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Beige',
          model: 'Beige Almo Fabric Sofa 3s',
          usage: '4 Months'),
    ),
    ProductData(
      imageUrl:
          'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      desc: 'Two yellow labrador pups for sale',
      productName: 'Yellow labrador',
      isFav: false,
      location: 'Hyderabad,Telangana',
      price: '₹ 40,000',
      sellingStatus: false,
      productDetailData:
          ProductDetailData(brand: 'Dog', model: 'Yellow labrador'),
    ),
    ProductData(
      imageUrl:
          'https://images.pexels.com/photos/1298601/pexels-photo-1298601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      desc:
          'Black X-Box controller which is in good condition with moderate usage',
      productName: 'X-Box Controller',
      isFav: false,
      location: 'Pune,Maharashtra',
      price: '₹ 20,000',
      sellingStatus: false,
      productDetailData: ProductDetailData(
          brand: 'Microsoft', model: 'X-Box controller', usage: '6 Weeks'),
    ),
    ProductData(
      imageUrl:
          'https://www.prodirectcricket.com/ProductImages/Main/193889_Main_Thumb_0381209.jpg',
      desc: 'Bat which is seasoned carefully',
      productName: 'Cricket Bat',
      isFav: false,
      location: 'Mysore,Karnataka',
      price: '₹ 2,000',
      sellingStatus: false,
      productDetailData: ProductDetailData(
        brand: 'Kookaburra',
        model: 'Bat',
        usage: '1 Month',
      ),
    ),
    ProductData(
      imageUrl:
          'https://images.unsplash.com/photo-1581605405669-fcdf81165afa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      desc: 'Travel Bag with no repairs',
      productName: 'Travel Bag',
      isFav: false,
      location: 'Trivandrum,Kerala',
      price: '₹ 2,500',
      sellingStatus: false,
      productDetailData: ProductDetailData(
        brand: 'Volunteer',
        model: 'Bag',
        usage: '2 Months',
      ),
    ),
    ProductData(
      imageUrl:
          'https://images.unsplash.com/photo-1556449895-a33c9dba33dd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Z3VpdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      desc: 'Guitar used moderately',
      productName: 'Guitar',
      isFav: false,
      location: 'Vijayawada,Andhra Pradesh',
      price: '₹ 12,500',
      sellingStatus: false,
      productDetailData: ProductDetailData(
        brand: 'Volunteer',
        model: 'Bag',
        usage: '3 Months',
      ),
    ),
    ProductData(
      imageUrl:
          'https://images.unsplash.com/photo-1473186578172-c141e6798cf4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fHBhaXIlMjBvZiUyMGNoYWlyc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      desc: '2 chairs without damage',
      productName: 'Chairs',
      isFav: false,
      location: 'Vellore,Tamil Nadu',
      price: '₹ 2,500/pc',
      sellingStatus: false,
      productDetailData: ProductDetailData(
        brand: 'IKEA',
        model: 'Chair',
        usage: '4 Months',
      ),
    ),
    ProductData(
      imageUrl:
          'https://cdn.vox-cdn.com/thumbor/pfaAXXsmPP8t1Ao7Gu-gCiS1kbI=/0x0:2040x1360/920x613/filters:focal(857x517:1183x843):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/65619647/vpavic_191010_3722_0002.0.jpg',
      desc: 'Wi-Fi router which is in good condition',
      productName: 'Wi-Fi Router',
      isFav: false,
      location: 'Kolkata,West Bengal',
      price: '₹ 10,500',
      sellingStatus: false,
      productDetailData: ProductDetailData(
        brand: 'Google',
        model: 'Google Nest Wi-Fi',
        usage: '3 Months',
      ),
    ),
  ];
}
