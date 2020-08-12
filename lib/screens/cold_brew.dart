import 'package:coffeebrew/constants/color_palette.dart';
import 'package:coffeebrew/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItem('assets/coffee4.png', '150', ColorPalette().secondSlice),
        buildListItem('assets/coffee2.png', '200', ColorPalette().firstSlice)
      ]
    );
  }

  buildListItem(String imgPath, String price, Color bgColor) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CoffeeDetails(imgPath: imgPath, headerColor: bgColor)
        ));
      },
      child: Stack(
        children: [
          Container(
            height: 300.0,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.transparent
            )
          ),
          Positioned(
            top: 100.0,
            child: Container(
              height: 200.0,
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage('assets/doodle.png'),
                  fit: BoxFit.none
                )
              )
            )
          ),
          Positioned(
            top: 100.0,
            child: Container(
              height: 200.0,
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white.withOpacity(0.6),
              )
            )
          ),
          Positioned(
            top: 100.0,
            child: Container(
              height: 200.0,
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: bgColor.withOpacity(0.9),
              )
            )
          ),
          Positioned(
            right: 2.0,
            child: Hero(
              tag: imgPath,
              child: Container(
                height: 250.0,
                width: 150.0,
                child: Image(image: AssetImage(imgPath), fit:BoxFit.scaleDown
              )
              )
            )
          ),
          Positioned(
            top: 125.0,
            left: 15.0,
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 20.0),
                ),
                Text(
                  '\$' + price,
                  style: GoogleFonts.bigShouldersText(
                      color: Colors.white, fontSize: 40.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Grady\'s COLD BREW',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 27.0),
                ),
                SizedBox(height: 2.0),
                Container(
                  width: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '65 reviews',
                            style: GoogleFonts.bigShouldersText(
                                color: Colors.white, fontSize: 15.0),
                          ),
                          SmoothStarRating(
                            starCount: 5,
                            size: 15.0,
                            color: Colors.white,
                            borderColor: Colors.white,
                            rating: 3.0
                          )
                        ]
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 75.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 17.0),
                              SizedBox(width: 5.0),
                              Text('Add',
                                      style: GoogleFonts.bigShouldersText(
                                      color: Color(0xFF23163D), fontSize: 15.0),
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ]
            )
          )
        ],
      )
    );
  }
}