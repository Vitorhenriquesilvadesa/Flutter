import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercado_livre_2/ads_page/ad_widget.dart';
import 'package:mercado_livre_2/ads_page/ads_page.dart';
import 'package:mercado_livre_2/controller/general/appearence.dart';

class AdEditor extends StatefulWidget {
  late String title, price, description;

  AdEditor(title, price, description, {super.key});

  @override
  State<StatefulWidget> createState() => AdEditorState();
}

class AdEditorState extends State<AdEditor> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  static String? title = "";
  static String? price = "";
  static String? description = "";
  static int? currentAdIndex;

  static bool isNewAd = true;

  static void loadEditorState(
      String title, String price, String description, int index) {
    AdEditorState.title = title;
    AdEditorState.price = price;
    AdEditorState.description = description;
    AdEditorState.currentAdIndex = index;
  }

  void updateValues() {
    _titleController.text = AdEditorState.title!;
    _priceController.text = AdEditorState.price!;
    _descriptionController.text = AdEditorState.description!;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      updateValues();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Appearence.getData(JuiceThemeData.primaryColor),
        iconTheme: IconThemeData(
          color: Appearence.getData(JuiceThemeData.textColor),
        ),
        title: Text(
          "Editor de Anúncios",
          style: TextStyle(
            color: Appearence.getData(JuiceThemeData.textColor),
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Form(
            key: _formState,
            child: SizedBox(
              width: 400,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    width: 400,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Appearence.getData(JuiceThemeData.secondaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (_titleController.text.isEmpty) {
                                return "Preencha este campo!";
                              }

                              return null;
                            },
                            maxLength: 20,
                            controller: _titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: const Text("Título",
                                  style: TextStyle(fontSize: 20)),
                              fillColor: Appearence.getData(
                                  JuiceThemeData.backgroundColor),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (_priceController.text.isEmpty ||
                                  double.tryParse(_priceController.text
                                          .replaceAll(",", "."))! <
                                      0.0) {
                                return "Preencha este campo corretamente!";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.number,
                            controller: _priceController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: const Text(
                                "Preço",
                                style: TextStyle(fontSize: 20),
                              ),
                              fillColor: Appearence.getData(
                                  JuiceThemeData.backgroundColor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (_descriptionController.text.isEmpty) {
                                return "Preencha este campo !";
                              }

                              return null;
                            },
                            controller: _descriptionController,
                            maxLines: 10,
                            maxLength: 200,
                            decoration: InputDecoration(
                              constraints: const BoxConstraints(minWidth: 200),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: const Text(
                                "Descrição",
                                style: TextStyle(fontSize: 20),
                              ),
                              fillColor: Appearence.getData(
                                  JuiceThemeData.backgroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 40, 20, 20),
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            setState(
                              () {
                                if (_formState.currentState!.validate()) {
                                  setState(
                                    () {
                                      if (AdEditorState.isNewAd) {
                                        AdsPageState.ads.insert(
                                          0,
                                          AdDescriptor(
                                            _titleController.text,
                                            <String>[
                                              _descriptionController.text
                                            ],
                                            double.parse(
                                              _priceController.text
                                                  .replaceAll(",", "."),
                                            ),
                                            400,
                                            500,
                                          ),
                                        );
                                      } else {
                                        setState(
                                          () {
                                            // AdsPageState.ads.removeAt(
                                            //     AdEditorState.currentAdIndex!);

                                            // AdsPageState.ads.add(
                                            //   AdDescriptor(
                                            //     _titleController.text,
                                            //     [_descriptionController.text],
                                            //     double.parse(_priceController.text),
                                            //     400,
                                            //     500,
                                            //   ),
                                            // );

                                            AdsPageState
                                                .ads[AdEditorState
                                                    .currentAdIndex!]
                                                .name = _titleController.text;
                                            AdsPageState
                                                .ads[AdEditorState
                                                    .currentAdIndex!]
                                                .attributes = <String>[
                                              _descriptionController.text
                                            ];
                                            AdsPageState
                                                    .ads[AdEditorState
                                                        .currentAdIndex!]
                                                    .price =
                                                double.parse(_priceController
                                                    .text
                                                    .replaceAll(",", "."));
                                          },
                                        );
                                      }
                                    },
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                        return const AdsPage();
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          child: const Text("Salvar"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (BuildContext context) {
                                  return const AdsPage();
                                },
                              ),
                            );
                          },
                          child: const Text("Cancelar"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
