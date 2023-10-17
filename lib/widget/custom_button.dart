import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String text;
  final Function() onpressed;
  const CustomButton({
    super.key,
    this.width = 140,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: FloatingActionButton.extended(
          backgroundColor: HexColor("#404040"),
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: onpressed,
          label: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          )),
    );
  }
}
