import 'package:flutter/material.dart';
class FormErrors extends StatelessWidget {
  const FormErrors({
    Key? key,
    required this.Errors,
  }) : super(key: key);

  final List<String> Errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        Errors.length,
            (index) => FormError_texts(Errors[index]),
      ),
    );
  }

  Row FormError_texts(String text) {
    return Row(
      children: [
        Icon(
          Icons.error,
          size: 20,
          color: Colors.red.shade200,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto-Medium",
          ),
        )
      ],
    );
  }
}