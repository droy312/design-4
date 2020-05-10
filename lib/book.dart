import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  Book({Key key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  String fontR = 'Poppins';
  String fontB = 'PoppinsBold';
  Color mainTextColor = Color.fromRGBO(60, 60, 60, 1);
  Color subTextColor = Colors.grey;
  String headerText = 'Books';

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
              color: mainTextColor,
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
                          imageCard('b1.jpg'),
                          imageCard('b3.jpg'),
                          imageCard('b5.jpg'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          imageCard('b2.jpg'),
                          imageCard('b4.jpg'),
                          imageCard('b6.jpg'),
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
