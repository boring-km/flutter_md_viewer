import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_md_viewer/core/code_element_builder.dart';
import 'package:flutter_md_viewer/data/model/page.dart';
import 'package:flutter_md_viewer/views/markdown/markdown_view_model.dart';
import 'package:markdown/markdown.dart';
import 'package:provider/provider.dart';

class MarkdownView extends StatelessWidget {
  const MarkdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final mdPage = ModalRoute.of<MdPage>(context)?.settings.arguments;
    final viewModel = context.watch<MarkdownViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Markdown(
          data: viewModel.content,
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
  }
}
