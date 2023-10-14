import 'package:flutter/material.dart';
import 'package:instagram/pages/colors.dart';
import 'package:instagram/pages/homepage/custom_widgets/story_ring.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Container(height: 64, color: Colors.black),
            Container(
              height: 96,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: StoryRing(
                      size: 64,
                      borderWidth: 4,
                      imageUrl: "https://thispersondoesnotexist.com",
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 650,
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    color: Colors.black,
                    child: Container(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              StoryRing(
                                size: 48,
                                borderWidth: 4,
                                imageUrl: "https://thispersondoesnotexist.com",
                              ),
                              const VerticalDivider(
                                width: 10,
                                color: Colors.black,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "usuarioTeste",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: CustomThemeData.mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      VerticalDivider(
                                        width: 15,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "51min",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: CustomThemeData.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "audioTeste",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: CustomThemeData.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: const Icon(Icons.menu,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 500,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 28, 28, 28),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
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
    );
  }
}
