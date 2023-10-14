import 'package:instagram/pages/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuCard extends StatefulWidget {
  late IconData icon;
  late String title;
  late FontWeight fontWeight;

  MenuCard({
    required MenuCardData menuCardData,
    super.key,
  }) {
    icon = menuCardData._icon;
    title = menuCardData._title;
    fontWeight = menuCardData._fontWeight;
  }

  @override
  MenuCardState createState() => MenuCardState();
}

class MenuCardState extends State<MenuCard> {
  Color currentColor = CustomThemeData.secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: currentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onHover: (value) {
          setState(() {
            currentColor = value
                ? CustomThemeData.terciaryColor
                : CustomThemeData.secondaryColor;
          });
        },
        onTap: () {},
        child: Row(
          children: [
            Icon(widget.icon, size: 32, color: CustomThemeData.mainColor),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: CustomThemeData.mainColor,
                  fontSize: 18,
                  fontWeight: widget.fontWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCardData {
  late IconData _icon;
  late String _title;
  late FontWeight _fontWeight;

  MenuCardData({
    required isBold,
    required icon,
    required title,
  }) {
    _icon = icon;
    _title = title;
    _fontWeight = isBold ? FontWeight.bold : FontWeight.normal;
  }
}
