import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_md_viewer/core/code_element_builder.dart';
import 'package:flutter_md_viewer/di/provider_setup.dart';
import 'package:flutter_md_viewer/routes.dart';
import 'package:flutter_md_viewer/views/home_view.dart';
// ignore: depend_on_referenced_packages
import 'package:markdown/markdown.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // 플랫폼 채널이 위젯 바인딩을 보장
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: await getProviders(),
      child: MaterialApp(
        title: 'Markdown Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 12),
          ),
        ),
        initialRoute: Routes.home,
        routes: {
          '/home': (context) => const HomeView(),
        },
      ),
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
            future: rootBundle.loadString('assets/test1.md'),
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
