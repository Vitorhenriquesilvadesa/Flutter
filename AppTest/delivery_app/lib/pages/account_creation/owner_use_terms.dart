import 'package:delivery_app/pages/account_creation/owner_account_creation.dart';
import 'package:delivery_app/pages/colors.dart';
import 'package:delivery_app/widgets/blur_image.dart';
import 'package:flutter/material.dart';

class OwnerUseTermsPage extends StatefulWidget {
  const OwnerUseTermsPage({super.key});

  @override
  State<StatefulWidget> createState() => _OwnerUseTermsPageState();
}

class _OwnerUseTermsPageState extends State<OwnerUseTermsPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.85), Colors.transparent],
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
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      margin: const EdgeInsets.only(bottom: 40),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Boas vindas ao FoodFy",
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lobster',
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                textAlign: TextAlign.justify,
                                "Primeiro precisamos de alguns dados sobre você e sua pizzaria para que possamos te ajudar da melhor forma.",
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lobster',
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: AppColors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                textAlign: TextAlign.justify,
                                "Mas antes, você precisa concordar com nossos termos de uso. Leia abaixo.",
                                softWrap: true,
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontFamily: 'Lobster',
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                useTerms,
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'Lobster',
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: AppColors.red,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: isChecked
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 18,
                                            )
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Aceito os termos e condições",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 185,
                              height: 56,
                              margin: const EdgeInsets.only(bottom: 40),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isChecked
                                      ? AppColors.green
                                      : Colors.transparent,
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                onPressed: isChecked
                                    ? () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                            return const OwnerAccountCreation();
                                          }),
                                        );
                                      }
                                    : null,
                                child: Text(
                                  "Continuar",
                                  style: TextStyle(
                                    color: isChecked
                                        ? Colors.white
                                        : Colors.transparent,
                                    fontSize: 22,
                                    fontFamily: 'Lobster',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

String useTerms =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse odio arcu, lobortis bibendum posuere vehicula, feugiat eu lorem. Duis congue ultrices aliquam. Fusce ante arcu, accumsan vel nulla vitae, gravida efficitur tortor. Fusce at viverra nibh. Integer quis dictum tortor. Etiam ut tristique mi. Aliquam maximus a sapien ac euismod. Maecenas imperdiet tristique dui et iaculis. Etiam feugiat blandit malesuada. Nullam pharetra quam quis sapien vehicula, at pharetra felis euismod. Cras imperdiet lorem gravida, dignissim est nec, gravida leo.";
