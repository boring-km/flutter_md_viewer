import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/data/model/page.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';
import 'package:flutter_md_viewer/routes.dart';

class CategoryViewModel with ChangeNotifier {

  int pageCount = 0;
  List<MdPage> pages = [];

  Future<bool> loadPageNames(Object? args) async {
    try {
      final category = (args as Map?)?['category'] as String? ?? '';
      pages = await MdLoader.loadPages(category);
      if (pages.isEmpty) return false;
      pageCount = pages.length;
      notifyListeners();
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  void loadPage(BuildContext context, int index) {
    Navigator.pushNamed(
      context,
      '${Pages.markdown}?pageUrl=${pages[index].pageUrl.replaceAll('/', '_')}',
      arguments: {
        'pageUrl': pages[index].pageUrl,
        'category': pages[index].category,
      },
    );
  }

  void goHome(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Pages.home,
    );
  }

}