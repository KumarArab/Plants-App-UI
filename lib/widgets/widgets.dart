import 'package:flutter/material.dart';
import 'package:plantsapp/screens/tiimeline.dart';
import 'package:plantsapp/widgets/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../plant_model.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorWhite,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: colorWhite,
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class Intro extends StatelessWidget {
  final String title;
  final String subtitle;

  Intro({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: colorWhite,
              fontSize: 45,
              fontFamily: "Saudagar",
            ),
          ),
          Divider(
            thickness: 1,
            color: colorWhite,
            indent: MediaQuery.of(context).size.width * 0.25,
            endIndent: MediaQuery.of(context).size.width * 0.25,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20,
              color: colorWhite,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class PlantItem extends StatelessWidget {
  final PlantModel plant;

  PlantItem({this.plant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Timeline(
            id: plant.id,
          ),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                      ),
                    ]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    child: Hero(
                      tag: plant.name,
                      child: Image.asset(plant.imageAsset),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      plant.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimelineEvent extends StatelessWidget {
  final String day;
  final String task;

  TimelineEvent({this.day, this.task});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      topLineStyle: LineStyle(color: colorWhite, width: 2),
      bottomLineStyle: LineStyle(color: colorWhite, width: 2),
      indicatorStyle: IndicatorStyle(
        width: 20,
        padding: EdgeInsets.all(10),
        color: colorWhite,
      ),
      rightChild: Container(
        constraints: const BoxConstraints(minHeight: 120),
        child: Center(
          child: Text(
            task,
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white),
          ),
        ),
      ),
      leftChild: Container(
        constraints: const BoxConstraints(minHeight: 120),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
