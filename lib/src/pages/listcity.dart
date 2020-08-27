import 'package:flutter/material.dart';
import 'package:guia_turistico/src/models/appdata.dart';
import 'package:guia_turistico/src/widgets/citybox.dart';
import 'package:guia_turistico/src/widgets/custom_appbar.dart';
import 'package:guia_turistico/src/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void cityBoxAction(cityData) {
    print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {
    //rebendo dados
    final continentIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<AppData>(
      builder: (context, appdata, child) {
        var cities = [];

        for (var country in appdata.data[continentIndex]['countries']) {
          cities.addAll(country['cities']);
        }

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              title:
                  "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
              context: context,
              showBack: true),
          drawer: CustomDrawer(context: context),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                  data: cities[index],
                  onTap: (cityData) {
                    cityBoxAction(cityData);
                  });
            }),
          ),
        );
      },
    );
  }
}
