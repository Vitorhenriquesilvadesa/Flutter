import 'package:delivery_app/pages/colors.dart';
import 'package:flutter/material.dart';

class NewAccountCard extends StatelessWidget {
  final String title;
  final String decorationImagePath;
  final String buttonText;
  final Color buttonColor;
  final StatefulWidget page;

  const NewAccountCard({
    super.key,
    required this.title,
    required this.decorationImagePath,
    required this.buttonText,
    required this.page,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              textAlign: TextAlign.center,
              title,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Lobster',
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 240,
            width: 240,
            margin: const EdgeInsets.only(bottom: 20),
            child: Image(
              image: AssetImage(decorationImagePath),
            ),
          ),
          SizedBox(
            width: 185,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return page;
                    },
                  ),
                );
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
