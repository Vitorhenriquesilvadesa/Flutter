import 'package:calculo_imc/application_themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String theme = "light";
  Map<String, ApplicationTheme> themes = {
    "light": LightTheme(),
    "dark": DarkTheme()
  };

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  Icon toggleThemeIcon = const Icon(Icons.light_mode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Calculadora IMC",
              style: TextStyle(color: themes[theme]?.appBarTextColor)),
          centerTitle: true,
          backgroundColor: themes[theme]?.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _weightController.clear();
                    _heightController.clear();
                    _result = "";
                  });
                },
                icon: Icon(Icons.refresh, color: themes[theme]?.textColor)),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (theme == "light") {
                      toggleThemeIcon = const Icon(Icons.dark_mode_rounded);
                      theme = "dark";
                      return;
                    } else {
                      toggleThemeIcon = const Icon(Icons.light_mode);
                      theme = "light";
                    }
                  });
                },
                icon: toggleThemeIcon,
                iconSize: 32,
                color: themes[theme]?.textColor)
          ],
        ),
        backgroundColor: themes[theme]?.backgroundColor,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: Image.asset("resources/images/weight.png",
                    width: 128, height: 128),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18, color: themes[theme]?.textColor),
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(color: themes[theme]?.textColor),
                    label: Text("Peso",
                        style: TextStyle(
                            fontSize: 24, color: themes[theme]?.textColor)),
                    prefixText: "Quilos: ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themes[theme]?.primaryColor, width: 3),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themes[theme]?.primaryColor, width: 3),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18, color: themes[theme]?.textColor),
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(color: themes[theme]?.textColor),
                    label: Text("Altura",
                        style: TextStyle(
                            fontSize: 24, color: themes[theme]?.textColor)),
                    prefixText: "Metros: ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themes[theme]?.primaryColor, width: 3),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themes[theme]?.primaryColor, width: 3),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themes[theme]?.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      onPressed: () {
                        if (_weightController.text == "" ||
                            _heightController.text == "") {
                          setState(() {
                            _result = "Preencha corretamente os campos";
                          });
                          return;
                        }

                        double weight = double.parse(_weightController.text
                            .replaceAll(",", ".")
                            .replaceAll(" ", ""));

                        double height = double.parse(_heightController.text
                            .replaceAll(",", ".")
                            .replaceAll(" ", ""));

                        double imc = weight / (height * height);
                        double imcSaver = 0;

                        if (imc > 25) {
                          imcSaver = imc - 24.9;
                        } else if (imc <= 18.5) {
                          imcSaver = 18.6 - imc;
                        }

                        String deltaWeight =
                            (imcSaver * height * height).toStringAsPrecision(3);

                        String roundedImc = (imc).toStringAsPrecision(4);

                        if (height > 0 && weight > 0) {
                          setState(() {
                            if (imc >= 40) {
                              _result =
                                  "IMC: $roundedImc \n Obesidade grau III (mórbida)."
                                  " Para chegar no IMC ideal você precisa perder $deltaWeight Kg.";
                            } else if (imc > 35) {
                              _result =
                                  "IMC: $roundedImc \n Obesidade grau II (severa)."
                                  " Para chegar no IMC ideal você precisa perder $deltaWeight Kg.";
                            } else if (imc > 30) {
                              _result = "IMC: $roundedImc \n Obesidade grau I."
                                  " Para chegar no IMC ideal você precisa perder $deltaWeight Kg.";
                            } else if (imc > 25) {
                              _result =
                                  "IMC: $roundedImc \n Levemente acima do peso."
                                  " Para chegar no IMC ideal você precisa perder $deltaWeight Kg.";
                            } else if (imc > 18.5) {
                              _result =
                                  "IMC: $roundedImc \n Peso ideal (parabéns). Não é necessário ganhar ou perder peso.";
                            } else if (imc >= 0) {
                              _result = "IMC: $roundedImc \n Abaixo do peso."
                                  " Para chegar no IMC ideal você precisa ganhar $deltaWeight Kg.";
                            }
                          });
                        } else {
                          setState(() {
                            _result =
                                "Hahaha... Altura ou peso negativos? Quem você pensa que é amigo? Albert Einstein? Isaac Newton? Eu acho que NÃO!!!";
                          });
                        }
                      },
                      child: Text("Calcular",
                          style: TextStyle(
                              color: themes[theme]?.textColor, fontSize: 20)))),
              Text(_result,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style:
                      TextStyle(fontSize: 25, color: themes[theme]?.textColor)),
            ],
          )),
        ));
  }
}
