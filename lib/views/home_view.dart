import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_md_viewer/core/code_element_builder.dart';
import 'package:flutter_md_viewer/views/home_view_model.dart';
import 'package:markdown/markdown.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.files.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  height: 1000,
                  child: Markdown(
                    data: viewModel.files[index],
                    shrinkWrap: true,
                    selectable: true,
                    extensionSet: ExtensionSet(
                      ExtensionSet.gitHubFlavored.blockSyntaxes,
                      [
                        EmojiSyntax(),
                        ...ExtensionSet.gitHubFlavored.inlineSyntaxes
                      ],
                    ),
                    builders: {
                      'code': CodeElementBuilder(),
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
