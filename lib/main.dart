import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;

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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        Icons.workspaces_filled,
                        color: Color(0xff4d4f52),
                      )),
                  Container(
                    height: 43,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff1b2027),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "images/timothy-dykes-yd4ubMUNTG0-unsplash-removebg-preview.png"),
                      ),
                    ),
                  )
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
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: 160,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 135,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  "images/tyler-nix-nwdtkFzDfPY-unsplash.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cappuccino",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 3,),
                          Text("With Oat Milk", style: TextStyle(
                            color: Color(0xff919293),
                            fontSize: 11
                          ),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(r'$', style: TextStyle(color: Color(0xffd17842), fontWeight: FontWeight.bold, fontSize: 20),),
                                  Text(" 4.20", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Container(

                                height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffd17842),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.add, color: Colors.white,size: 20,))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0xff242931),
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        ),
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
