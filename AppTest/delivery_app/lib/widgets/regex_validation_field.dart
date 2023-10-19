// ignore: must_be_immutable
import 'package:delivery_app/pages/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegexValidationField extends StatefulWidget {
  final String? Function(String? value)? validator;
  final String title;
  final String? value;

  const RegexValidationField({
    super.key,
    this.value,
    required this.validator,
    required this.title,
  });

  @override
  State<RegexValidationField> createState() => _RegexValidationFieldState();
}

class _RegexValidationFieldState extends State<RegexValidationField> {
  bool isValid = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                  ),
                ),
              ),
              TextFormField(
                controller: _controller,
                style: const TextStyle(
                    fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: widget.validator,
                onChanged: (value) {
                  String? validationResult = widget.validator!(value);
                  setState(() {
                    isValid = validationResult == null;
                  });
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, top: 10),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isValid ? AppColors.green : AppColors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              isValid ? FontAwesomeIcons.check : FontAwesomeIcons.exclamation,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
