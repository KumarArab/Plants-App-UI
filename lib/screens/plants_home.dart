import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantsapp/plant_data.dart';
import 'package:plantsapp/screens/search.dart';
import 'package:plantsapp/widgets/colors.dart';
import 'package:plantsapp/widgets/widgets.dart';

class PlantsHome extends StatefulWidget {
  @override
  _PlantsHomeState createState() => _PlantsHomeState();
}

class _PlantsHomeState extends State<PlantsHome> {
  double startIndent, endIndent;
  bool popular = true;

  void showPopular(BuildContext context) {
    setState(() {
      popular = true;
      startIndent = MediaQuery.of(context).size.width * 0.05;
      endIndent = MediaQuery.of(context).size.width * 0.6;
    });
  }

  void showRecent(BuildContext context) {
    setState(() {
      popular = false;
      startIndent = MediaQuery.of(context).size.width * 0.48;
      endIndent = MediaQuery.of(context).size.width * 0.3;
    });
  }

  @override
  void didChangeDependencies() {
    startIndent = MediaQuery.of(context).size.width * 0.05;
    endIndent = MediaQuery.of(context).size.width * 0.6;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: Column(
          children: [
            NavBar(),
            Intro(
              title: "Explore plants",
              subtitle: "Trending plants for your home",
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => Search(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorWhite, width: 1),
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: TextStyle(
                        color: colorWhite,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: colorWhite,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FlatButton(
                                onPressed: () => showPopular(context),
                                highlightColor: colorWhite,
                                child: Text(
                                  "MOST POPULAR",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    color: popular ? Colors.black : Colors.grey,
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () => showRecent(context),
                                highlightColor: colorWhite,
                                child: Text(
                                  "RECENT",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    color: popular ? Colors.grey : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 5,
                            color: Colors.black,
                            indent: startIndent,
                            endIndent: endIndent,
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) => PlantItem(
                          plant: popular ? plantData[i] : recentData[i],
                        ),
                        itemCount:
                            popular ? plantData.length : recentData.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffe3e3e3),
                              offset: Offset(6, 2),
                              blurRadius: 1.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "ORDER SEEDS",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
