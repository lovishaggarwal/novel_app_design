import 'package:flutter/material.dart';
import 'package:novelappdesign/frontPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: null,
            color: Colors.black54,
            iconSize: 25.0,
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: null,
        ),
        title: Center(
          child: Container(
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.grey[400].withOpacity(0.4),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.brown[400],
                    size: 22.0,
                  ),
                  onPressed: null,
                ),
                hintText: 'Search a book...',
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            height: 35.0,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
        ),
      ),
      body: SingleChildScrollView(child: FrontPage()),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
