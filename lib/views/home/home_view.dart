import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/views/home/home_view_model.dart';
import 'package:flutter_md_viewer/views/widgets/category_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final viewModel = context.watch<HomeViewModel>();

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
                  SizedBox(
                    height: getCategoryHeight(height),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: viewModel.categoryList.length,
                      itemBuilder: (context, i) {
                        return CategoryButton(
                          category: viewModel.categoryList[i],
                          color: Colors.amberAccent,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Lottie.asset(
                      'assets/animations/67025-business-analysis.json',
                      width: width / 3,
                      height: height / 3,
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

  double getCategoryHeight(double height) =>
      height / 15 < 90 ? 90 : height / 15;

  Padding buildTitleText(double height) {
    return Padding(
      padding: EdgeInsets.only(top: height / 10, bottom: height / 30),
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
