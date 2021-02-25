import 'package:flutter/material.dart';

Widget CustomAppBar(
    {GlobalKey<ScaffoldState> scaffoldKey,
    BuildContext context,
    String title = '',
    bool hideSeacrh = false,
    bool showBack = false,
    bool}) {
  IconButton drawerIcon = IconButton(
    icon: Icon(Icons.menu, color: Colors.black, size: 30),
    onPressed: () {
      scaffoldKey.currentState.openDrawer();
    },
  );

  IconButton backIcon = IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
    onPressed: () {
      Navigator.pop(context); //voltar
    },
  );
  IconButton leadingButton = drawerIcon;
  if (showBack) {
    leadingButton = backIcon;
  }

  void serachAction() {
    Navigator.pushReplacementNamed(context, 'search');
  }

  return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica Neue'),
      ),
      leading: leadingButton,
      actions: [
        !hideSeacrh
            ? IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 30),
                onPressed: serachAction,
              )
            : Container()
      ]);
}
