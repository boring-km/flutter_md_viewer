import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/ui/category_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              width: 1280,
              height: 800,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTitleText(height),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Lottie.asset(
                      'assets/animations/67025-business-analysis.json',
                      width: width / 2,
                      height: height / 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: StaggeredGrid.count(
                      crossAxisCount: 20,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 20,
                      axisDirection: AxisDirection.down,
                      children: const [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: CategoryButton(
                            text: 'Bible',
                            color: Colors.amberAccent,
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: CategoryButton(
                            text: 'Test',
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTitleText(double height) {
    return Padding(
      padding: EdgeInsets.only(top: height / 10),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 32),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              '안녕하세요...!',
              speed: const Duration(milliseconds: 200),
            )
          ],
        ),
      ),
    );
  }
}
