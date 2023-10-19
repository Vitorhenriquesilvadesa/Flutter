import 'dart:ui';

import 'package:delivery_app/pages/colors.dart';
import 'package:delivery_app/widgets/blur_image.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  bool canScroll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BlurImage(
            imagePath: "assets/images/login_page_bg.jpeg",
            blurIntensity: 10,
            opacity: 0.3,
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Center(
              child: Container(
                height: 480,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(10),
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 30,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                iconSize: 15,
                                color: AppColors.white,
                                alignment: Alignment.center,
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: const Text(
                          "E-mail",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lobster',
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          "Senha",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lobster',
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        margin: const EdgeInsets.only(bottom: 60),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: TextStyle(fontFamily: 'Ubuntu'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.brown,
                            elevation: 10,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Lobster',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
