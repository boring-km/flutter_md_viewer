import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: height / 2,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) {
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
