//Tratando a logo marca em um único lugar
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  //Criando variável para cor
  final Color? minhaTitleColor;
  //Trtatando o tamanho da font
  final double textSize;

  const AppNameWidget({
    this.minhaTitleColor,
    this.textSize = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Minha',
            style: TextStyle(
              color: minhaTitleColor ?? CustomColors.customSwatchColor,
            ),
          ),
          TextSpan(
            text: 'logo',
            style: TextStyle(color: CustomColors.customContrastColor),
          ),
        ],
      ),
    );
  }
}
