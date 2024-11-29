import 'package:flutter/material.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onCompleted;

  const OTPField({
    super.key,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return _buildSingleBox(index, context);
      }),
    );
  }

  Widget _buildSingleBox(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && value.length == 1) {
            //Focus the next field automatically
            if (index < 4) {
              FocusScope.of(context).nextFocus();
            } else {
              onCompleted(controller.text);
            }
          }
        },
      ),
    );
  }
}
