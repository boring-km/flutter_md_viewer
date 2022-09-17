import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/views/category/category_view.dart';
import 'package:flutter_md_viewer/views/home/home_view.dart';
import 'package:flutter_md_viewer/views/markdown/markdown_view.dart';

class Routes {
  static final routes = {
    Pages.home: (context) => const HomeView(),
    Pages.category: (context) => const CategoryView(),
    Pages.markdown: (context) => const MarkdownView(),
  };

  static MaterialPageRoute<dynamic> setCategoryRoute(RouteSettings settings) {
    final category =
    settings.name?.replaceAll('${Pages.category}?category=', '');
    print('cate: $category');
    return MaterialPageRoute(
      builder: (context) {
        return const CategoryView();
      },
      settings: RouteSettings(
        name: settings.name,
        arguments: {
          'category': category,
        },
      ),
    );
  }

  static MaterialPageRoute<dynamic> setMarkdownRoute(RouteSettings settings) {
    final pageUrl =
    settings.name?.replaceAll('${Pages.markdown}?pageUrl=', '');
    return MaterialPageRoute(
      builder: (context) {
        return const MarkdownView();
      },
      settings: RouteSettings(
        name: settings.name,
        arguments: {
          'pageUrl': pageUrl?.replaceAll('_', '/'),
        },
      ),
    );
  }
}

class Pages {
  static const home = '/';
  static const category = '/category';
  static const markdown = '/category/markdown';
}
