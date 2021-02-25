import 'package:flutter/material.dart';
import 'package:guia_turistico/src/models/appdata.dart';
import 'package:guia_turistico/src/widgets/citybox.dart';
import 'package:guia_turistico/src/widgets/custom_appbar.dart';
import 'package:guia_turistico/src/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class ContinentPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          title: 'Escolha um continente',
          context: context,
        ),
        drawer: CustomDrawer(context: context),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            var cities = [];
            for (var country in appdata.data[index]['countries']) {
              cities.addAll(country['cities']);
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "${appdata.data[index]['name']} ${cities.length}",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        seeCityActions(context, index);
                      },
                      child: Text(
                        "Ver cidades",
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return CityBox(
                        data: cities[index],
                        onTap: cityBoxAction,
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void seeCityActions(context, index) {
    Navigator.pushNamed(context, 'listcity', arguments: index);
  }

  void cityBoxAction(cityData) {}
}
