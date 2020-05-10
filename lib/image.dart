import 'package:flutter/material.dart';

// class ImageClass extends StatefulWidget {
//   final bool isDark;

//   ImageClass({this.isDark});

//   @override
//   _ImageClassState createState() => _ImageClassState(isDark: isDark);
// }

class ImageClass extends StatelessWidget {
  String fontR = 'Poppins';
  String fontB = 'PoppinsBold';
  Color subTextColor = Colors.grey;
  String headerText = 'Images';

  Color textColor = Color.fromRGBO(60, 60, 60, 1);
  bool isDark;

  ImageClass({this.isDark});

  Container imageCard(String image) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 5,
        right: 5,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Image.asset(
          'images/$image',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //* main header
        Container(
          margin: EdgeInsets.only(
            left: 10,
            bottom: 20,
          ),
          child: Text(
            'Latest ' + headerText,
            style: TextStyle(
              fontFamily: fontR,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isDark ? Color.fromRGBO(249, 249, 249, 1) : Color.fromRGBO(60, 60, 60, 1),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: ListView(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          imageCard('p51.jpg'),
                          imageCard('p53.jpg'),
                          imageCard('p55.jpg'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          imageCard('p52.jpg'),
                          imageCard('p54.jpg'),
                          imageCard('p56.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
