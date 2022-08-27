import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/routes.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Pages.markdown,
          arguments: {
            'type': text,
          },
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(16),
            right: Radius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
