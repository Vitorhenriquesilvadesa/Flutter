import 'package:flutter/material.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
        ));
  }
}
