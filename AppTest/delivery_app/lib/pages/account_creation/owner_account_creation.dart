import 'package:delivery_app/pages/colors.dart';
import 'package:delivery_app/widgets/blur_image.dart';
import 'package:delivery_app/widgets/regex_validation_field.dart';
import 'package:flutter/material.dart';

class OwnerAccountCreation extends StatefulWidget {
  const OwnerAccountCreation({super.key});

  @override
  State<StatefulWidget> createState() => _OwnerAccountCreationState();
}

class _OwnerAccountCreationState extends State<OwnerAccountCreation> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            BlurImage(
              imagePath: "assets/images/login_page_bg.jpeg",
              blurIntensity: 7,
              opacity: 0,
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.black.withOpacity(0.6),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: 30,
                    bottom: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 30,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: IconButton(
                                iconSize: 15,
                                color: AppColors.white,
                                alignment: Alignment.center,
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  if (currentPageIndex > 0) {
                                    setState(() {
                                      _pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.decelerate);
                                      currentPageIndex--;
                                    });
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ),
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
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "Sobre sua empresa",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Ubuntu',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "Preencha os campos abaixo para começar",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 30,
                              fontFamily: 'Lobster'),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Form(
                                key: forms_keys[index],
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: RegexValidationField(
                                        validator: isNameValid,
                                        title: "Nome da pizzaria",
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: RegexValidationField(
                                        validator: isEmailValid,
                                        title: "Email",
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 60),
                                      child: RegexValidationField(
                                        validator: isPhoneNumberValid,
                                        title: "Telefone (somente números)",
                                      ),
                                    ),
                                    Container(
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (forms_keys[
                                                  _pageController.page!.round()]
                                              .currentState!
                                              .validate()) {
                                            setState(() {
                                              _pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.decelerate,
                                              );
                                              currentPageIndex++;
                                            });
                                          } else {}
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          elevation: 10,
                                          shadowColor: Colors.black,
                                        ),
                                        child: const Text(
                                          "Continuar",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? isEmailValid(String? email) {
    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
    );

    if (email != null) {
      return emailRegExp.hasMatch(email) ? null : "Digite um email válido!";
    } else {
      return "Digite um email válido";
    }
  }

  String? isNameValid(String? name) {
    return name!.length < 3 ? "Digite um nome correto" : null;
  }

  String? isPhoneNumberValid(String? phoneNumber) {
    final phoneRegExp = RegExp(r'^\+?[0-9]*$');

    if (phoneNumber != null) {
      return (phoneRegExp.hasMatch(phoneNumber) &&
              phoneNumber.replaceAll(RegExp(r'[^0-9]'), "").length >= 8)
          ? null
          : "Digite um número válido";
    } else {
      return "Digite um número válido";
    }
  }
}

List<GlobalKey<FormState>> forms_keys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];
