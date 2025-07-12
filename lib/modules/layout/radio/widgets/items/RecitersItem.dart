import 'package:flutter/material.dart';

class RecitersItem extends StatelessWidget {
  RecitersItem({super.key, required this.text, required this.item});

  String text;
  String item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 390,
      height: 141,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: theme.primaryColor,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage(item)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  text,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow_rounded, size: 50),
                    Icon(Icons.volume_down_alt, size: 50),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
