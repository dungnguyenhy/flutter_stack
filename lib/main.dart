
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg1.jpg'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(.0),
                    Colors.black.withOpacity(.3)
                  ])),
              child: Padding(
                padding: EdgeInsets.all(20),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        MakeItem(image: 'assets/images/1.jpg'),
                        MakeItem(image: 'assets/images/2.jpg'),
                        MakeItem(image: 'assets/images/3.jpg')
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          itemPoint(top: 140.0,left: 40.0),
           itemPoint(top: 190.0,left: 190.0),
         itemPoint(top: 219.0,left: 60.0),
        ]),
      ),
    );
  }
}

Widget itemPoint({top, left}) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.blue.withOpacity(.3)),
      child: PlayAnimation<double>(
        tween: Tween(begin: 4, end: 6),
        duration: Duration(seconds: 1),
        builder: (context, child, value) {
          return Container(
            margin: EdgeInsets.all(value),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          );
        },
      ),
    ),
  );
}

Widget MakeItem({image}) {
  return AspectRatio(
    aspectRatio: 1.7 / 2,
    child: Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200]),
              child: Text(
                '2.1 mi',
                style: TextStyle(color: Colors.grey[500]),
              ),
            )
          ],
        ),
        SizedBox(height: 30,),
        Text('Google map',style: TextStyle(color: Colors.green[800],fontSize: 25,fontWeight: FontWeight.bold),)
      ]),
    ),
  );
}
