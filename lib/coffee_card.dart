import 'package:flutter/material.dart';

import 'coffee_details_page.dart';

class CoffeeCard extends StatelessWidget {
  List<String> images = [
    "images/tyler-nix-nwdtkFzDfPY-unsplash.jpg",
    "images/newcappuccino.jpg",
    "images/newcoffee.jpg",
    "images/nicholas-grande-Hd36cpebWbQ-unsplash.jpg",
  ];

  List<String> ingredients = [
    "With Oat Milk",
    "With Cinnamon Powder",
    "With Chocolate Powder",
    "With Caramel Drizzle"
  ];

  List<double> price = [4.29, 3.21, 6.46, 2.90];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CoffeeDetailsPage()));
        },
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
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
                                  image: AssetImage(images[index]),
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
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                ingredients[index],
                                style: TextStyle(
                                    color: Color(0xff919293), fontSize: 11),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        r'$ ',
                                        style: TextStyle(
                                            color: Color(0xffd17842),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "${price[index]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0xffd17842),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ))
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
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
