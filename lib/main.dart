import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:olx_clone/Models/chat_users.dart';
import 'package:olx_clone/screens/account_screen.dart';
import 'package:olx_clone/screens/add_product.dart';
import 'package:olx_clone/screens/ads_screen.dart';
import 'package:olx_clone/screens/category_screen.dart';
import 'package:olx_clone/screens/chats_screen.dart';
import 'package:olx_clone/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:olx_clone/Models/products.dart';
import 'package:toast/toast.dart';

BuildContext testContext;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Product>(
          create: (_) => Product(),
        ),
        ChangeNotifierProvider<ChatMessages>(
          create: (_) => ChatMessages(),
        ),
      ],
      child: MaterialApp(
        title: 'Olx',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        //NOTE - Adding a splash screen

        home: AnimatedSplashScreen(
          splashIconSize: 200,
          duration: 2000,
          backgroundColor: Color.fromARGB(255, 0, 37, 51),
          splash: Center(
            child: Column(
              children: [
                Text(
                  'OlX',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'India',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'India\'s leading',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  'marketplace',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
          pageTransitionType: PageTransitionType.fade,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: MyHomePage(),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ChatScreen.routeName: (ctx) => ChatScreen(),
          PropertyScreen.routeName: (ctx) => PropertyScreen(),
          OlxAutoCategory.routeName: (ctx) => OlxAutoCategory(),
          MobileCategory.routeName: (ctx) => MobileCategory(),
          JobsCategory.routeName: (ctx) => JobsCategory(),
          BikesCategory.routeName: (ctx) => BikesCategory(),
          ElectronicCategory.routeName: (ctx) => ElectronicCategory(),
          VehicleSpareCategory.routeName: (ctx) => VehicleSpareCategory(),
          FurnitureCategory.routeName: (ctx) => FurnitureCategory(),
          FashionCategory.routeName: (ctx) => FashionCategory(),
          SportsCategory.routeName: (ctx) => SportsCategory(),
          PetsCategory.routeName: (ctx) => PetsCategory(),
          ServicesCategory.routeName: (ctx) => ServicesCategory(),
          AddProductScreen.routeName: (ctx) => AddProductScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeScreen homeScreen;
  Widget currentScreen;

  @override
  void initState() {
    super.initState();
  }

  PageController _controller = PageController(initialPage: 0);
  bool _homeIcon = true;
  bool _msgIcon = false;
  bool _favIcon = false;
  bool _accountIcon = false;

  final List<Widget> pages = [
    HomeScreen(),
    ChatScreen(),
    FavScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: pages,
        allowImplicitScrolling: true,
        physics: NeverScrollableScrollPhysics(),
      ),

      //NOTE - Creating customized bottom navigation bar

      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 2,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // NOTE - Home Screen

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(
                    _homeIcon ? Icons.home : Icons.home_outlined,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.jumpToPage(0);
                    setState(() {
                      if (!_msgIcon && !_accountIcon && !_favIcon) {
                        _homeIcon = true;
                      } else {
                        _homeIcon = !_homeIcon;
                        _msgIcon = false;
                        _favIcon = false;
                        _accountIcon = false;
                      }
                    });
                  },
                ),
              ),
              // NOTE - Chat Screen

              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: IconButton(
                  icon: Icon(
                    _msgIcon ? Icons.messenger : Icons.messenger_outline_sharp,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.jumpToPage(1);
                    Toast.show(
                      'Chats will not be saved and new chats cannot be added',
                      context,
                      duration: Toast.LENGTH_LONG,
                      backgroundColor: Colors.black87,
                    );
                    setState(() {
                      if (!_homeIcon && !_accountIcon && !_favIcon) {
                        _msgIcon = true;
                      } else {
                        _msgIcon = !_msgIcon;
                        _homeIcon = false;
                        _accountIcon = false;
                        _favIcon = false;
                      }
                    });
                  },
                ),
              ),
              // NOTE - Favourite Screen

              IconButton(
                icon: Icon(
                  _favIcon ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                ),
                onPressed: () {
                  _controller.jumpToPage(2);
                  setState(() {
                    if (!_homeIcon && !_accountIcon && !_msgIcon) {
                      _favIcon = true;
                    } else {
                      _favIcon = !_favIcon;
                      _msgIcon = false;
                      _accountIcon = false;
                      _homeIcon = false;
                    }
                  });
                },
              ),
              // NOTE - Account Screen

              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(
                    _accountIcon ? Icons.person : Icons.person_outline,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.jumpToPage(3);
                    Toast.show(
                      'You cannot view or change any settings',
                      context,
                      duration: Toast.LENGTH_LONG,
                      backgroundColor: Colors.black87,
                    );
                    setState(() {
                      if (!_homeIcon && !_msgIcon && !_favIcon) {
                        _accountIcon = true;
                      } else {
                        _accountIcon = !_accountIcon;
                        _homeIcon = false;
                        _msgIcon = false;
                        _favIcon = false;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,

          //NOTE - Adding border color for floating action button

          border: Border.fromBorderSide(
            BorderSide(color: Colors.indigo, width: 4.5),
          ),
        ),
        child: IconButton(
          // elevation: 0,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'The product will not be saved and will be gone after quitting the app as it is not connected to any database.',
                  maxLines: 3,
                ),
                action: SnackBarAction(
                  label: 'Ok',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 9),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return AddProductScreen();
              }),
            );
          },
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
