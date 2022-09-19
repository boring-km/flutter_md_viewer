import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/routes.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.category,
    required this.color,
  });

  final String category;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '${Pages.category}?category=$category',
            arguments: {
              'category': category,
            },
          );
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
              right: Radius.circular(16),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
