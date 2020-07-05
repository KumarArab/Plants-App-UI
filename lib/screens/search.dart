import 'package:flutter/material.dart';
import 'package:plantsapp/widgets/colors.dart';
import 'package:plantsapp/widgets/widgets.dart';

class Search extends StatelessWidget {
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
            Container(
              padding: const EdgeInsets.all(30),
              child: TextField(
                autofocus: true,
                style: TextStyle(color: colorWhite, fontFamily: "Poppins"),
                cursorColor: colorWhite,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: colorWhite),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(width: 1, color: colorWhite),
                    ),
                    hintStyle:
                        TextStyle(color: colorWhite, fontFamily: "Poppins")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
