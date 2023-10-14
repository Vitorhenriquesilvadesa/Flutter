import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StoryRing extends StatefulWidget {
  late double size;
  late String imageUrl;
  late int borderWidth;

  StoryRing({
    required this.size,
    required this.borderWidth,
    required this.imageUrl,
    super.key,
  });

  @override
  State<StoryRing> createState() => StoryRingState();
}

class StoryRingState extends State<StoryRing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 255, 221, 0),
            Color.fromARGB(255, 255, 115, 0),
            Color.fromARGB(255, 255, 0, 0),
            Color.fromARGB(255, 192, 0, 186),
            Color.fromARGB(255, 192, 0, 186),
          ],
        ),
        borderRadius: BorderRadius.circular(widget.size / 2),
      ),
      alignment: Alignment.center,
      child: Container(
          width: widget.size - widget.borderWidth,
          height: widget.size - widget.borderWidth,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(widget.size / 2),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: widget.size - widget.borderWidth,
            backgroundImage: NetworkImage(widget.imageUrl),
          )),
    );
  }
}
