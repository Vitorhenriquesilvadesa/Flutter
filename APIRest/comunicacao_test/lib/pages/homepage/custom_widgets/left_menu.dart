import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu_card.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 0, 30),
              width: 140,
              child: const Image(
                image: AssetImage(
                  "res/text_logo.png",
                ),
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuCards.length,
                itemBuilder: (context, index) {
                  return MenuCard(
                    menuCardData: menuCards[index],
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

List<MenuCardData> menuCards = [
  MenuCardData(
    icon: FontAwesomeIcons.instagram,
    title: "Página inicial",
    isBold: true,
  ),
  MenuCardData(
    icon: Icons.search,
    title: "Pesquisa",
    isBold: false,
  ),
  MenuCardData(
    icon: Icons.explore_outlined,
    title: "Explorar",
    isBold: false,
  ),
  MenuCardData(
    icon: FontAwesomeIcons.circlePlay,
    title: "Reels",
    isBold: false,
  ),
  MenuCardData(
    icon: FontAwesomeIcons.facebookMessenger,
    title: "Mensagens",
    isBold: false,
  ),
  MenuCardData(
    icon: FontAwesomeIcons.heart,
    title: "Notificações",
    isBold: false,
  ),
  MenuCardData(
    icon: Icons.add,
    title: "Criar",
    isBold: false,
  ),
  MenuCardData(
    icon: FontAwesomeIcons.user,
    title: "Perfil",
    isBold: false,
  ),
  MenuCardData(
    icon: FontAwesomeIcons.facebook,
    title: "Facebook",
    isBold: false,
  ),
  MenuCardData(
    icon: Icons.menu,
    title: "Mais",
    isBold: false,
  ),
];
