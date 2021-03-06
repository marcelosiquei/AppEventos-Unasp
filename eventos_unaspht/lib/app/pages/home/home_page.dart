import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_unaspht/app/pages/home/components/retangular_home_button.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/square_home_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    Color blue = Theme.of(context).primaryColor;
    double appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.powerOff), 
          onPressed: () {}
        ),
        actions: <Widget>[
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.redAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              FontAwesomeIcons.solidBell,
              color: Color(0xFFF3BB36),
            ),
          ),
        ],
        centerTitle: true,
        title: Image.asset(
          "assets/img/isolado_branco.png",
          width: 80,
        ),
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: appWidth * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SquareHomeButton("Aluno", Color(0xFF34495E),
                      FontAwesomeIcons.userGraduate, context),
                  SquareHomeButton("saídas", Color(0xFF6FBFCC),
                      FontAwesomeIcons.signOutAlt, context),
                  SquareHomeButton("cardápio", Color(0xFF9A735C),
                      FontAwesomeIcons.utensils, context)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SquareHomeButton("portais", Color(0xFF818CD3),
                      FontAwesomeIcons.link, context),
                  SquareHomeButton("mapa", Color(0xFF7DB760),
                      FontAwesomeIcons.mapMarkedAlt, context),
                  SquareHomeButton("ramais", Color(0xFFFFAB91),
                      FontAwesomeIcons.phoneAlt, context),
                  SquareHomeButton("Eventos", Color(0xFFFFAB91),
                      FontAwesomeIcons.calendarCheck, context),
                ],
              ),
              SizedBox(
                height: appWidth * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectangularHomeButton("calendário", Color(0xFFC0CA33),
                      FontAwesomeIcons.calendarAlt, context),
                  RectangularHomeButton("Notícias", Color(0xFF95A5A6),
                      FontAwesomeIcons.bullhorn, context),
                ],
              ),
              SizedBox(
                height: appWidth * 0.1,
              ),
              Text(
                "últimas notícias".toUpperCase(),
              ),
              SizedBox(
                height: 20,
              ),
              _news(context),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: 1,
        tabs: [
          TabData(iconData: FontAwesomeIcons.userAlt, title: "PERFIL"),
          TabData(iconData: FontAwesomeIcons.home, title: "HOME"),
          TabData(iconData: FontAwesomeIcons.cog, title: "AJUSTES"),
          TabData(iconData: FontAwesomeIcons.calendarCheck, title: "EVENTOS")
        ],
        circleColor: orange,
        inactiveIconColor: orange,
        onTabChangedListener: (position) {
          setState(() {});
        },
      ),
    );
  }

  Widget _news(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      enableInfiniteScroll: false,
      height: appWidth * .3,
      items: [1, 2, 3, 4, 5, 6].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/img/test.png", fit: BoxFit.contain),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "semana da arte".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: appWidth * .02,
                              ),
                              Text(
                                "Idealizado e coordenado pela direção da Escola de Artes. Foi um evento top!",
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black45),
                              ),
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}