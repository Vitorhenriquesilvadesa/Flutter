import 'package:flutter/material.dart';

class EditorBody extends StatelessWidget {
  const EditorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromRGBO(8, 8, 10, 1),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
              padding: const EdgeInsets.all(10),
              color: const Color.fromRGBO(15, 15, 20, 1),
              child: const Expanded(
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  // keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.white),
                  expands: true,
                  cursorColor: Color.fromRGBO(40, 40, 70, 1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
