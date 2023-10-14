import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:noteblock/ads/ad.dart';
import 'package:noteblock/database/ad_helper.dart';
import 'package:noteblock/database/iad.dart';
import 'package:noteblock/editor/ad_editor_page.dart';
import 'package:noteblock/model/ads_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IAd helper = AdHelper();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchAds();
  }

  Future<void> _fetchAds() async {
    try {
      final data = await helper.getAll();
      setState(() {
        ads = data;
      });

      debugPrint("Anuncios carregados com sucesso");
    } catch (e) {
      debugPrint("Erro ao buscar anúncios: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ads.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AdEditorPage();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                transform: Matrix4.rotationZ(0.2),
                child: const Text(
                  "Não há nada para ver aqui. (-_-)",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 50),
                ),
              )),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AdEditorPage();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 20, 20, 20),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 320),
              child: ListView.builder(
                itemCount: ads.length,
                itemBuilder: ((context, index) {
                  Ad item = ads[index];
                  debugPrint(ads[index].toString());
                  return Slidable(
                    startActionPane: ActionPane(
                      closeThreshold: 0.1,
                      openThreshold: 0.1,
                      dismissible: DismissiblePane(
                        onDismissed: () => _onDismissed(index, Actions.delete),
                      ),
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          label: "delete",
                          backgroundColor: Colors.redAccent,
                          icon: Icons.delete,
                          onPressed: (context) =>
                              _onDismissed(index, Actions.delete),
                        ),
                        SlidableAction(
                          label: "edit",
                          backgroundColor: Colors.greenAccent,
                          icon: Icons.edit,
                          onPressed: (context) =>
                              _onDismissed(index, Actions.edit),
                        ),
                        SlidableAction(
                          label: "share",
                          backgroundColor: Colors.blueAccent,
                          icon: Icons.share,
                          onPressed: (context) =>
                              _onDismissed(index, Actions.share),
                        ),
                      ],
                    ),
                    key: Key(ads[index].id.toString()),
                    child: Container(
                      height: 500,
                      width: 300,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 30, 30, 30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 280,
                            height: 280,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(10)),
                            child: item.image,
                          ),
                          SizedBox(
                            width: 280,
                            height: 32,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 32,
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                    child: Text(
                                      item.title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 32,
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                    child: Text(
                                      "R\$ ${item.price.toString()}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 280,
                            height: 148,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              textAlign: TextAlign.justify,
                              item.description,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      );
    }
  }

  void _onDismissed(int index, Actions action) async {
    switch (action) {
      case Actions.delete:
        {
          setState(() {
            Ad item = ads[index];
            ads.removeAt(index);
            helper.delete(item);
          });
        }

      case Actions.edit:
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdEditorPage(
                  index: index,
                  ad: ads[index],
                );
              },
            ),
          );
        }

      case Actions.share:
        {
          XFile file = XFile(ads[index].imagePath!.replaceAll("\\", "/"));
          debugPrint("Sharing file: ${file.path}");

          await Share.shareXFiles(
            [file],
            subject: "See this ad with me!",
          );
        }
    }
  }
}

enum Actions { share, delete, edit }
