import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Markdown Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            // bodyText2: TextStyle(fontSize: 12),
            ),
      ),
      home: MarkdownScreen(),
    ),
  );
}

class MarkdownScreen extends StatelessWidget {
  const MarkdownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: rootBundle.loadString('assets/test.md'),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data!,
                    extensionSet: ExtensionSet(
                      ExtensionSet.gitHubFlavored.blockSyntaxes,
                      [
                        EmojiSyntax(),
                        ...ExtensionSet.gitHubFlavored.inlineSyntaxes
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              },
            )),
      ),
    );
  }
}
