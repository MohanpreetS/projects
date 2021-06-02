import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../widgets/home_section.dart';
import '../widgets/main_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _current = 0;
  final list = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Rodhos'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(CartScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 23,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(mQuery.size.height * 0.3),
            child: Container(
              height: mQuery.size.height * 0.24,
              //width: mQuery.size.width,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.only(
                bottom: 10,
                left: 50,
                right: 50,
              ),
              // child: Center(
              //   child: Text('Best dishes'),
              // ),
              //TODO: Carousel Slider
              child: Column(
                children: [
                  CarouselSlider(
                    items: list.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'text $i',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: mQuery.size.height * 0.18,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (i, _) {
                        setState(() {
                          _current = i;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...list.map((e) {
                        return Container(
                          width: _current == e - 1 ? 12 : 10,
                          height: _current == e - 1 ? 12 : 10,
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 2,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == e - 1
                                ? Colors.white
                                : Colors.grey.shade400,
                          ),
                        );
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            HomeSection(
              color: Colors.white,
              nextColor: Theme.of(context).primaryColor,
            ),
            HomeSection(
              nextColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
            HomeSection(
              color: Colors.white,
              nextColor: Theme.of(context).primaryColor,
            ),
            HomeSection(
              nextColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ));
  }
}
