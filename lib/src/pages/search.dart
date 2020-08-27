import 'package:flutter/material.dart';
import 'package:guia_turistico/src/models/appdata.dart';
import 'package:guia_turistico/src/widgets/custom_appbar.dart';
import 'package:guia_turistico/src/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            title: 'Busque uma cidade',
            context: context,
            hideSeacrh: true),
        drawer: CustomDrawer(context: context),
           backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Pesquisa")
            ],
          ),
        ),
      ),
    );
  }
}
