import 'package:flutter_md_viewer/views/home/home_view.dart';
import 'package:flutter_md_viewer/views/markdown/markdown_view.dart';

class Routes {
  static final routes = {
    Pages.home: (context) => const HomeView(),
    Pages.markdown: (context) => const MarkdownView(),
  };
}

class Pages {
  static const home = '/home';
  static const markdown = '/markdown';
}
