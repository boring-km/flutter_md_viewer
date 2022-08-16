import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_md_viewer/code_element_builder.dart';
// ignore: depend_on_referenced_packages
import 'package:markdown/markdown.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Markdown Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            // bodyText2: TextStyle(fontSize: 12),
            ),
      ),
      home: const MarkdownScreen(),
    ),
  );
}

class MarkdownScreen extends StatelessWidget {
  const MarkdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
            future: rootBundle.loadString('assets/test.md'),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data!,
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
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
