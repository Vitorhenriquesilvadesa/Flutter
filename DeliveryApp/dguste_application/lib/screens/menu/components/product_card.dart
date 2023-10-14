import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  // pathImage
  final void Function()? onChanged;

  const ProductCard(
      {super.key,
      required this.name,
      required this.description,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.5),
          borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      title: Text(name),
      subtitle: Text(description),
      leading: Container(
        width: 70,
        height: 50,
        color: Colors.red,
      ),
      trailing: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [IconButton(onPressed: null, icon: Icon(Icons.add_circle))],
      ),
      onTap: onChanged,
    );
  }
}
