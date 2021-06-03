import 'package:flutter/material.dart';
import 'package:flutter_coffeeapp/coffee_card.dart';
import 'package:flutter_coffeeapp/special_coffee_card.dart';

import 'coffee_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 620,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff1b2027),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Color(0xff4d4f52),
                        )),
                    Image.asset(
                      "images/timothy-dykes-yd4ubMUNTG0-unsplash-removebg-preview.png",
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Find the best\ncoffee for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff141921),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find your coffee...",
                        hintStyle: TextStyle(color: Color(0xff3c4046)),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[600],
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TabBar(
                    isScrollable: true,
                    controller: tabController,
                    labelColor: Color(0xffd17842),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelColor: Color(0xff3c4046),
                    indicator:
                        CircleTabIndicator(color: Color(0xffd17842), radius: 4),
                    tabs: [
                      Tab(
                        text: "Cappuccino",
                      ),
                      Tab(
                        text: "Americano",
                      ),
                      Tab(
                        text: "Espresso",
                      ),
                      Tab(
                        text: "Mocha",
                      ),
                      Tab(
                        text: "Macchiato",
                      ),
                      Tab(
                        text: "Doppio",
                      ),
                    ]),
                CoffeeCard(),
                Text(
                  "Special for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SpecialCoffeeCard(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xffd17842),
        unselectedItemColor: Color(0xff4d4f52),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
