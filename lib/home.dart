import 'package:flutter/material.dart';

import './image.dart';
import './book.dart';
import './people.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;

  List<Widget> _widgetList = [
    ImageClass(),
    Book(),
    People(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String searchBarHint = 'Search...';
  String fontR = 'Poppins';
  String fontB = 'PoppinsBold';
  String textFieldText;
  TextEditingController textFieldCtrl;
  Color mainTextColor = Color.fromRGBO(60, 60, 60, 1);
  Color subTextColor = Colors.black54;
  List<Color> iconBtnColor = List.filled(4, Color.fromRGBO(7, 121, 228, 1));
  Color iconBtnPressedColor = Color.fromRGBO(6, 100, 189, 1);
  // Device size
  Size ds;
  // iconBtn size
  double iconBtnSize;
  double iconBtnWidth;
  // iconBtnIcon
  List<IconData> iconBtnData = [
    Icons.signal_cellular_4_bar,
    Icons.pets,
    Icons.fastfood,
    Icons.desktop_mac
  ];
  Color bgColor = Color.fromRGBO(249, 249, 249, 1);
  Color searchBarColor = Colors.grey[200];
  Color bottomBarItemColorPressed = Color.fromRGBO(6, 100, 189, 1);
  Color unColor = Colors.grey;

  // 22, 36, 71 | 35, 46, 74 | 228, 65, 90 | 199, 56, 79

  GestureDetector iconBtn(String text, int index) {
    return GestureDetector(
      onTapDown: (d) {
        setState(() {
          iconBtnColor[index] = iconBtnPressedColor;
        });
      },
      onTapUp: (d) {
        print(text + ' pressed');
        setState(() {
          iconBtnColor[index] = Color.fromRGBO(7, 121, 228, 1);
        });
      },
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: iconBtnWidth,
            height: iconBtnSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: iconBtnColor[index],
            ),
            child: Icon(
              iconBtnData[index],
              color: Colors.white,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: fontR,
                fontSize: 16,
                color: subTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;
    iconBtnSize = (50 / ds.width) * 360;
    iconBtnWidth = (ds.width - 50) / 4;

    _widgetList = [
      ImageClass(isDark: isDark),
      Book(),
      People(),
    ];

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        color: bgColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //* search bar
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: searchBarColor,
                ),
                child: TextField(
                  controller: textFieldCtrl,
                  onSubmitted: (text) {
                    textFieldText = text;
                    textFieldCtrl.clear();
                  },
                  style: TextStyle(
                    fontFamily: fontR,
                    fontSize: 18,
                    color: mainTextColor,
                  ),
                  decoration: InputDecoration(
                    hintText: searchBarHint,
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: fontR,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              //* icon btns
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTapDown: (d) {
                        setState(() {
                          iconBtnColor[0] = iconBtnPressedColor;
                        });
                      },
                      onTapUp: (d) {
                        print('Nature' + ' pressed');
                        setState(() {
                          // TODO --------------------------------------------------------
                          iconBtnColor[0] = Color.fromRGBO(7, 121, 228, 1);
                          bgColor = Color.fromRGBO(22, 36, 71, 1);
                          searchBarColor = Color.fromRGBO(35, 46, 74, 1);
                          for (int i = 0; i < 4; i++) {
                            iconBtnColor[i] = Color.fromRGBO(228, 65, 90, 1);
                            iconBtnPressedColor =
                                Color.fromRGBO(199, 56, 79, 1);
                          }
                          subTextColor = Color.fromRGBO(249, 249, 249, 1);
                          mainTextColor = Colors.white;
                          unColor = Colors.white54;
                          bottomBarItemColorPressed = Color.fromRGBO(228, 65, 90, 1);
                        });
                        isDark = true;
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            width: iconBtnWidth,
                            height: iconBtnSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: iconBtnColor[0],
                            ),
                            child: Image.asset(
                              'images/tree.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Text(
                              'Nature',
                              style: TextStyle(
                                fontFamily: fontR,
                                fontSize: 16,
                                color: subTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    iconBtn('Animals', 1),
                    iconBtn('Food', 2),
                    iconBtn('Tech', 3),
                  ],
                ),
              ),

              Expanded(child: _widgetList[_selectedIndex]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        unselectedItemColor: unColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
            ),
            title: Text('1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            title: Text('2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text('3'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: bottomBarItemColorPressed,
      ),
    );
  }
}
