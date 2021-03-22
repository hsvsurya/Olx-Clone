import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:olx_clone/screens/category_screen.dart';
import 'package:olx_clone/screens/product_detail_screen.dart';
import 'package:olx_clone/screens/search_result_screen.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _search = TextEditingController();
  List _searchItems = [];

  Column _categories(Icon icon, String title, double padding,
      {Widget routeName}) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(PageTransition(
              child: routeName,
              type: PageTransitionType.leftToRight,
              duration: Duration(milliseconds: 300),
            ))
                .then((value) {
              setState(() {});
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: padding, right: 20),
            child: icon,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding, right: 20),
          child: Text(title),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context).product;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 18),

        /** NOTE - Custom scroll view helps to make the entire page scrollable
         *  even if there are nested scrollable widgets. Custom scroll view
         *  takes slivers as arguments which makes the entire page into single
         *  scrollable rather than multi scrollable.
         */

        child: CustomScrollView(
          slivers: [
            SliverList(
              // shrinkWrap: true,
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Text('location'),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,

                          // NOTE - Search Bar

                          child: OutlineSearchBar(
                            textEditingController: _search,
                            borderColor: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            hintText: 'Find Cars, Mobiles and more...',
                            onSearchButtonPressed: (String str) {
                              // print(_searchItems);
                              setState(() {
                                _searchItems.clear();
                                if (str != "") {
                                  for (var i = 0; i < productData.length; i++) {
                                    /**NOTE - The keyword only searches for the product name*/

                                    if (productData[i]
                                        .productName
                                        .toLowerCase()
                                        .contains(str.toLowerCase())) {
                                      _searchItems.add(productData[i]);
                                    }
                                  }

                                  /* NOTE - If the keyword is found we will be pushed to
                                  *  next page displaying the items in which the keyword is
                                  *  present.*/

                                  if (_searchItems.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: SearchResultScreen(
                                          searchData: _searchItems,
                                        ),
                                        type: PageTransitionType.topToBottom,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    ).then((val) {
                                      setState(() {});
                                    });
                                  } else {
                                    /**NOTE - If the entered value is not found an empty page is pushed
                                     * saying there are no products with the keyword you entered.
                                     */

                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: NotFoundScreen(str: str),
                                        type: PageTransitionType.topToBottom,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    );
                                  }
                                } else {
                                  _searchItems.clear();

                                  // NOTE - Shows alert dialog when we pressed search without entering anything.

                                  showOkAlertDialog(
                                    context: context,
                                    alertStyle: AdaptiveStyle.adaptive,
                                    title: 'Error',
                                    message:
                                        'Please enter something to search. You cannot search empty',
                                    okLabel: 'Ok',
                                  );
                                }
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Browse Categories'),
                            TextButton(
                              child: Text(
                                'See all',
                                style: TextStyle(fontStyle: FontStyle.normal),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: CategoryListScreen(),
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        //SECTION - Categories

                        _categories(
                          Icon(
                            Icons.car_rental,
                            size: 40,
                            color: Colors.blue[900],
                          ),
                          'Olx Cars(auto)',
                          25.0,
                          routeName: OlxAutoCategory(),
                        ),
                        _categories(
                          Icon(
                            Icons.home_work_sharp,
                            size: 40,
                            color: Colors.yellow[800],
                          ),
                          'Properties',
                          40.0,
                          routeName: PropertyScreen(),
                        ),
                        _categories(
                          Icon(
                            Icons.phone_android,
                            size: 40,
                            color: Colors.cyan,
                          ),
                          'Mobiles',
                          40.0,
                          routeName: MobileCategory(),
                        ),
                        _categories(
                          Icon(
                            Icons.work_rounded,
                            size: 40,
                            color: Colors.cyan[700],
                          ),
                          'Jobs',
                          50.0,
                          routeName: JobsCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.motorbike,
                            size: 40,
                            color: Colors.orange[900],
                          ),
                          'Bikes',
                          40.0,
                          routeName: BikesCategory(),
                        ),
                        _categories(
                          Icon(
                            Icons.desktop_windows_sharp,
                            size: 40,
                            color: Colors.indigo[900],
                          ),
                          'Electronics &\n Appliances',
                          40.0,
                          routeName: ElectronicCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.car_door,
                            size: 40,
                            color: Colors.cyan[800],
                          ),
                          'Commercial Vehcles &\n '
                          '            Spares',
                          40.0,
                          routeName: VehicleSpareCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.sofa_single,
                            size: 40,
                            color: Colors.red[900],
                          ),
                          'Furniture',
                          40.0,
                          routeName: FurnitureCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.tshirt_crew,
                            size: 40,
                            color: Colors.deepPurpleAccent,
                          ),
                          'Fashion',
                          40.0,
                          routeName: FashionCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.guitar_electric,
                            size: 40,
                            color: Colors.blueAccent[700],
                          ),
                          'Books Sports & Hobbies',
                          40.0,
                          routeName: SportsCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.dog,
                            size: 40,
                            color: Colors.deepOrangeAccent,
                          ),
                          'Pets',
                          40.0,
                          routeName: PetsCategory(),
                        ),
                        _categories(
                          Icon(
                            CommunityMaterialIcons.bell,
                            size: 40,
                            color: Colors.lightBlue,
                          ),
                          'Services',
                          40.0,
                          routeName: ServicesCategory(),
                        ),
                      ],

                      //!!SECTION - Categories
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, bottom: 4),
                    child: Text(
                      'Fresh Recommendations',
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ),

            //NOTE - Products in a grid view

            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int ind) {
                  return InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(PageRouteBuilder(pageBuilder: (_, __, ___) {
                      //   return ProductDetailScreen(
                      //     index: ind,
                      //   );
                      // }));

                      /**NOTE - When we push to one page and made changes there
                       *   which effects the home page, the changes made there should
                       *   be immediately visible after popping out from the child page
                       *   then this approach is used.
                       */

                      Navigator.push(
                        context,
                        PageTransition(
                          child: ProductDetailScreen(
                            index: ind,
                          ),
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                        ),
                      ).then((val) {
                        setState(() {});
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Card(
                        elevation: 0.4,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Image.network(
                                    productData[ind].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // NOTE - Adding favourites

                                Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(top: 10, right: 8),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: productData[ind].isFav
                                          ? Icon(Icons.favorite,
                                              color: Colors.pink)
                                          : Icon(Icons.favorite_border),
                                      onPressed: () {
                                        setState(() {
                                          productData[ind].isFav =
                                              !productData[ind].isFav;
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
                                productData[ind].price,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: Text(productData[ind].productName),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black45,
                                  ),
                                  Text(
                                    productData[ind].location,
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: productData.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 3.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  final String str;
  NotFoundScreen({this.str});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Search Items',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'There are no results with keyword $str',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<Map> category = [
    {
      'icon': Icons.car_rental,
      'title': Text('Olx Cars(auto)'),
      'color': Colors.blue[900],
      'route': OlxAutoCategory.routeName,
    },
    {
      'icon': Icons.home_work,
      'title': Text('Properties'),
      'color': Colors.yellow[800],
      'route': PropertyScreen.routeName,
    },
    {
      'icon': Icons.phone_android,
      'title': Text('Mobiles'),
      'color': Colors.cyan,
      'route': MobileCategory.routeName,
    },
    {
      'icon': Icons.work_rounded,
      'title': Text('Jobs'),
      'color': Colors.cyan[700],
      'route': JobsCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.motorbike,
      'title': Text('Bikes'),
      'color': Colors.orange[900],
      'route': BikesCategory.routeName,
    },
    {
      'icon': Icons.desktop_windows_sharp,
      'title': Text('Electronics & Appliances'),
      'color': Colors.indigo[900],
      'route': ElectronicCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.car_door,
      'title': Text('Commercial Vehicles & Spares'),
      'color': Colors.cyan[800],
      'route': VehicleSpareCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.sofa_single,
      'title': Text('Furniture'),
      'color': Colors.red[900],
      'route': FurnitureCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.tshirt_crew,
      'title': Text('Fashion'),
      'color': Colors.deepPurpleAccent,
      'route': FashionCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.guitar_electric,
      'title': Text('Books Sports & Hobbies'),
      'color': Colors.blueAccent[700],
      'route': SportsCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.dog,
      'title': Text('Pets'),
      'color': Colors.deepOrangeAccent,
      'route': PetsCategory.routeName,
    },
    {
      'icon': CommunityMaterialIcons.bell,
      'title': Text('Services'),
      'color': Colors.lightBlue,
      'route': ServicesCategory.routeName,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (_, int ind) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(category[ind]['route']);
                },
                child: ListTile(
                  leading: Icon(
                    category[ind]['icon'],
                    color: category[ind]['color'],
                  ),
                  title: category[ind]['title'],
                ),
              ),
              Divider(height: 4, thickness: 0.6),
            ],
          );
        },
        itemCount: 12,
      ),
    );
  }
}
