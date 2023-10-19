import 'package:delivery_app/pages/colors.dart';
import 'package:delivery_app/pages/account_creation/owner_use_terms.dart';
import 'package:delivery_app/widgets/blur_image.dart';
import 'package:delivery_app/widgets/new_account_card.dart';
import 'package:flutter/material.dart';

class AccountTypeSelection extends StatefulWidget {
  const AccountTypeSelection({super.key});

  @override
  State<StatefulWidget> createState() => _AccountTypeSelectionState();
}

class _AccountTypeSelectionState extends State<AccountTypeSelection> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            BlurImage(
              imagePath: "assets/images/login_page_bg.jpeg",
              blurIntensity: 15,
              opacity: 0.3,
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Center(
                child: SizedBox(
                  height: 560,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return NewAccountCard(
                        title: titles[index],
                        buttonText: buttonTexts[index],
                        decorationImagePath: decorationImagePaths[index],
                        buttonColor: buttonColors[index],
                        page: pages[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> titles = [
  "Criar uma conta cliente",
  "Criar uma conta premium",
  "Criar uma conta de estabelecimento",
];

List<String> decorationImagePaths = [
  "assets/images/new_account_client_decoration.png",
  "assets/images/new_account_premium_decoration.png",
  "assets/images/new_account_owner_decoration.png",
];

List<String> buttonTexts = [
  "Vamos nessa!",
  "Escolha Premium!",
  "Com certeza!",
];

List<Color> buttonColors = [AppColors.brown, AppColors.green, AppColors.orange];

List<StatefulWidget> pages = [
  const OwnerUseTermsPage(),
  const OwnerUseTermsPage(),
  const OwnerUseTermsPage(),
];
