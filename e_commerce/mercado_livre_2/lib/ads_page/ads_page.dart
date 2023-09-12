import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mercado_livre_2/ads_page/ad_editor.dart';
import 'package:mercado_livre_2/ads_page/ad_widget.dart';
import 'package:mercado_livre_2/controller/general/appearence.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({super.key});

  @override
  State<AdsPage> createState() => AdsPageState();
}

class AdsPageState extends State<AdsPage> {
  bool isSearching = false;

  AppBar? header;

  static List<AdDescriptor> ads = [];

  @override
  Widget build(BuildContext context) {
    header = _createHeader();

    return Scaffold(
      appBar: header,
      body: ListView.builder(
        itemCount: ads.length,
        itemBuilder: (context, index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  setState(
                    () {
                      ads.remove(ads[index]);
                    },
                  );
                },
              ),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    setState(
                      () {
                        AdEditorState.isNewAd = false;
                        AdEditorState.loadEditorState(
                            ads[index].name,
                            ads[index].price.toString(),
                            ads[index].attributes[0],
                            index);
                      },
                    );

                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return AdEditor("", "", "");
                        },
                      ),
                    );
                  },
                  backgroundColor:
                      Appearence.getData(JuiceThemeData.primaryColor),
                  foregroundColor: Appearence.getData(JuiceThemeData.textColor),
                  icon: Icons.mode_edit_rounded,
                  label: 'Edit',
                ),
              ],
            ),
            key: Key(ads[index].name),
            child: ads[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appearence.getData(JuiceThemeData.primaryColor),
        child: const Icon(Icons.add),
        onPressed: () {
          setState(
            () {
              AdEditorState.title = "";
              AdEditorState.price = "";
              AdEditorState.description = "";
            },
          );
          AdEditorState.isNewAd = true;
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) {
                return AdEditor("", "", "");
              },
            ),
          );
        },
      ),
    );
  }

  AppBar _createHeader() {
    return !isSearching
        ? AppBar(
            backgroundColor: Appearence.getData(JuiceThemeData.primaryColor),
            title: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Image.asset("resources/images/logo_header.png"),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      isSearching = !isSearching;
                      header = _createHeader();
                      debugPrint("Clicked");
                    },
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Appearence.getData(JuiceThemeData.textColor),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Appearence.getData(JuiceThemeData.textColor),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Appearence.getData(JuiceThemeData.textColor),
                ),
              ),
            ],
          )
        : AppBar(
            backgroundColor: Appearence.getData(JuiceThemeData.primaryColor),
            title: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Image.asset("resources/images/logo_header.png"),
                ),
              ],
            ),
            actions: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 216,
                  child: TextField(
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor:
                          Appearence.getData(JuiceThemeData.backgroundColor),
                      focusColor:
                          Appearence.getData(JuiceThemeData.backgroundColor),
                      hoverColor:
                          Appearence.getData(JuiceThemeData.backgroundColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isSearching = !isSearching;
                              _createHeader();
                            },
                          );
                        },
                        icon: Icon(
                          Icons.close,
                          color: Appearence.getData(JuiceThemeData.textColor),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search,
                            color:
                                Appearence.getData(JuiceThemeData.textColor)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
