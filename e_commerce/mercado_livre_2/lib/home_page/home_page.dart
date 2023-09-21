import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercado_livre_2/ads_page/ads_page.dart';
import 'package:mercado_livre_2/controller/general/appearence.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appearence.getData(JuiceThemeData.primaryColor),
        title: Text(
          "Mercado Livre",
          style: TextStyle(
            color: Appearence.getData(JuiceThemeData.textColor),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 150),
            color: Appearence.getData(JuiceThemeData.backgroundColor),
            child: const Center(
              child: Image(
                image: AssetImage("resources/images/logo.png"),
                width: 200,
                height: 200,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Appearence.getData(JuiceThemeData.primaryColor),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return const AdsPage();
                        },
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Entrar",
                style: TextStyle(
                  color: Appearence.getData(JuiceThemeData.textColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
