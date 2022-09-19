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

  static Route<dynamic>? setCategoryRoute(RouteSettings settings) {
    final category =
        settings.name?.replaceAll('${Pages.category}?category=', '');
    return PageRouteBuilder(
      pageBuilder: (c, _, __) {
        return const CategoryView();
      },
      transitionsBuilder: (context, animation, sec, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      settings: RouteSettings(
        name: settings.name,
        arguments: {
          'category': category,
        },
      ),
    );
  }

  static Route<dynamic>? setMarkdownRoute(RouteSettings settings) {
    final pageUrl = settings.name?.replaceAll('${Pages.markdown}?pageUrl=', '');
    return PageRouteBuilder(
      pageBuilder: (c, _, __) {
        return const MarkdownView();
      },
      transitionsBuilder: (context, animation, sec, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
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
  static const markdown = '/markdown';
}
