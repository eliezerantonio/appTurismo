import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guia_turistico/src/models/appdata.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context).requestData();

    if (req) {
      //ir home
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle
        .dark); //meter a infromacao de bateria rede... preto

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/transferir.png'),
            loading
                ? Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      "Carregando informações...",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(),
            loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.greenAccent))
                : Container(),
            !loading
                ? Container(
                    margin: EdgeInsets.all(30),
                    child: RaisedButton(
                      onPressed: () {
                        requestInfo();
                      },
                      child: Text("Tentar novamente"),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
