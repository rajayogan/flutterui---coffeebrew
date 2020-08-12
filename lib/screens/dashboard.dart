import 'package:coffeebrew/constants/color_palette.dart';
import 'package:coffeebrew/screens/black_gold.dart';
import 'package:coffeebrew/screens/cold_brew.dart';
import 'package:coffeebrew/screens/gold_brew.dart';
import 'package:coffeebrew/screens/mccafe.dart';
import 'package:coffeebrew/screens/nescafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final colorPalette = ColorPalette();

  var _selectedOption = 0;

  List allOptions = [BlackGold(), ColdBrew(), Nescafe(), McCafe(), GoldBrew()];

  List isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent),
        Container(
            height: screenHeight,
            width: screenWidth / 5,
            color: colorPalette.leftBarColor),
        Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 5),
              color: Colors.white,
            )),
        Positioned(top: 35.0, left: 20.0, child: Icon(Feather.menu)),
        Positioned(top: 35.0, right: 20.0, child: Icon(Feather.shopping_bag)),
        Positioned(
            top: screenHeight - (screenHeight - 100.0),
            left: (screenWidth / 5) + 25.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('CoffeeHouse',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 40.0)),
              Text('A lot can happen over coffee',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59FB0), fontSize: 15.0)),
              SizedBox(height: 20.0),
              Container(
                height: 40.0,
                width: 225.0,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.4)),
                      ),
                      contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                      hintText: 'search...',
                      hintStyle: GoogleFonts.bigShouldersText(
                          color: Color(0xFFA59FB0), fontSize: 15.0),
                      suffixIcon: Icon(Icons.search,
                          color: Colors.grey.withOpacity(0.4))),
                ),
              )
            ])),
        buildSideNavigator(),
        Positioned(
          top: (screenHeight / 3) + 5.0,
          left: (screenWidth / 5) + 25.0,
          child: Container(
            height: screenHeight - ((screenHeight / 3) + 50.0),
            width: screenWidth - ((screenWidth / 5) + 40.0),
            child: allOptions[_selectedOption]
          )
        )
      ],
    ));
  }

  buildSideNavigator() {
    return Positioned(
        top: 75.0,
        child: RotatedBox(
            quarterTurns: 3,
            child: Container(
                width: MediaQuery.of(context).size.height - 100.0,
                height: MediaQuery.of(context).size.width / 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOption('Black Gold', 0),
                      buildOption('Cold Brew', 1),
                      buildOption('Nescafe', 2),
                      buildOption('McCafe', 3),
                      buildOption('Gold Brew', 4),
                    ]))));
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF23163D)))
            : Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(onTap: () {
          setState(() {
            _selectedOption = index;
            isOptionSelected(index);
          });

        },
        child: Text(
          title,
          style: isSelected[index] ? GoogleFonts.bigShouldersText(
                color: Color(0xFF23163D), fontSize: 18.0) : GoogleFonts.bigShouldersText(
                color: Color(0xFFA59FB0), fontSize: 17.0),
        )
        )
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
