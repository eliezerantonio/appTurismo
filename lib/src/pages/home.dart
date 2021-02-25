import 'package:flutter/material.dart';
import 'package:guia_turistico/src/models/appdata.dart';
import 'package:guia_turistico/src/widgets/custom_appbar.dart';
import 'package:guia_turistico/src/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey, title: 'Home', context: context),
        drawer: CustomDrawer(context: context),

        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text("Bem vindo(a) ao!", style: styles),
              ),
              Image.asset('lib/assets/transferir.png'),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("Seu guia de viagem perfeito!", style: styles),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
