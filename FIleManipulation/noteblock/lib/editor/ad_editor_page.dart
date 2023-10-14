import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:noteblock/ads/ad.dart';
import 'package:noteblock/core/app/home_page.dart';
import 'package:noteblock/database/ad_helper.dart';
import 'package:noteblock/database/iad.dart';
import 'package:noteblock/model/ads_model.dart';

class AdEditorPage extends StatefulWidget {
  final Ad? ad;
  final int? index;

  AdEditorPage({Key? key, this.index, this.ad}) : super(key: key);

  @override
  State<AdEditorPage> createState() => _AdEditorPageState();
}

class _AdEditorPageState extends State<AdEditorPage> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  IAd helper = AdHelper();

  @override
  void initState() {
    super.initState();
    if (widget.ad != null) {
      final ad = widget.ad!;
      _titleController.text = ad.title;
      _priceController.text = ad.price;
      _descriptionController.text = ad.description;
      _imageFile = File(ad.imagePath!);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _copyImageToStorage();
      });
    }
  }

  Future<void> _copyImageToStorage() async {
    if (_imageFile != null) {
      Directory appDir = await getApplicationDocumentsDirectory();
      final fileName = 'ad_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final newImagePath = '${appDir.path}/$fileName';

      try {
        await _imageFile!.copy(newImagePath);
        _imageFile = File(newImagePath);
        widget.ad?.imagePath = newImagePath;
      } catch (e) {
        debugPrint('Erro ao copiar a imagem: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Editor de Anuncios",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 320,
              height: 520,
              margin: EdgeInsets.all(
                (MediaQuery.of(context).size.height - 600) / 2,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 20, 20),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.yellowAccent, width: 3),
              ),
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: _imageFile != null
                            ? Image.file(_imageFile!)
                            : const Icon(Icons.add_a_photo),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 80,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextFormField(
                              controller: _titleController,
                              textAlign: TextAlign.center,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length > 20) {
                                  return "Preencha este campo!";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.yellowAccent,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.text,
                              maxLength: 20,
                              decoration: InputDecoration(
                                labelText: "Title",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 30, 30, 30),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.greenAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 80,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextFormField(
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+[.,]?\d{0,2}')),
                              ],
                              controller: _priceController,
                              textAlign: TextAlign.center,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length > 10) {
                                  if (double.parse(_priceController.text) > 0) {
                                    return "Preencha este campo!";
                                  } else {
                                    return "Digite um preço maior que zero!";
                                  }
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.yellowAccent,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Price",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 30, 30, 30),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.greenAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 80,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextFormField(
                              maxLength: 300,
                              maxLines: 4,
                              controller: _descriptionController,
                              textAlign: TextAlign.center,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length > 300) {
                                  return "Preencha este campo!";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.yellowAccent,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Description",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 30, 30, 30),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.greenAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 250,
                                  height: 32,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.greenAccent),
                                    child: const Text(
                                      "Salvar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate() &&
                                          _imageFile != null) {
                                        final title = _titleController.text;
                                        final price = _priceController.text;
                                        final description =
                                            _descriptionController.text;
                                        final imagePath =
                                            _imageFile?.path ?? '';

                                        await _copyImageToStorage();

                                        if (widget.ad == null) {
                                          Ad newAd = Ad(
                                            title,
                                            price,
                                            description,
                                            imagePath,
                                          );
                                          final savedAd =
                                              await helper.save(newAd);

                                          if (savedAd != null) {
                                            setState(() {
                                              ads.add(newAd);
                                            });
                                            debugPrint(
                                                "Anuncio salvo com sucesso");
                                          } else {
                                            debugPrint(
                                                "Erro ao salvar anuncio");
                                          }
                                        } else {
                                          Ad ad = widget.ad!;
                                          ad.title = title;
                                          ad.price = price;
                                          ad.description = description;
                                          ad.imagePath = _imageFile?.path;

                                          final index = await helper.edit(ad);

                                          if (index != null) {
                                            setState(() {
                                              ads[widget.index!] = ad;
                                            });
                                            debugPrint(
                                                "Anuncio editado com sucesso");
                                          } else {
                                            debugPrint(
                                                "Erro ao editar anuncio");
                                          }
                                        }

                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return const HomePage();
                                            },
                                          ),
                                        );
                                      } else {}
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 250,
                                  height: 32,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent),
                                    child: const SizedBox(
                                      width: 250,
                                      child: Text(
                                        "Cancelar",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const HomePage();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
