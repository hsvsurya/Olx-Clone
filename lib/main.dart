import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:olx_clone/screens/account_screen.dart';
import 'package:olx_clone/screens/ads_screen.dart';
import 'package:olx_clone/screens/chats_screen.dart';
import 'package:olx_clone/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:olx_clone/Models/products.dart';

BuildContext testContext;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Product(),
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
                  'Indias leading',
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
          ChatScreen.routeName: (ctx) => ChatScreen(),
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
  PageController _controller = PageController(initialPage: 0);
  bool _homeIcon = true;
  bool _msgIcon = false;
  bool _favIcon = false;
  bool _accountIcon = false;

  List<Widget> pages = [
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

      //NOTE - Creating customized buttom navigation bar

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
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: IconButton(
                  icon: Icon(
                    _msgIcon ? Icons.messenger : Icons.messenger_outline_sharp,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.jumpToPage(1);
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
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(
                    _accountIcon ? Icons.person : Icons.person_outline,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.jumpToPage(3);
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
          onPressed: () {},
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
