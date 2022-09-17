import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/data/model/page.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';
import 'package:flutter_md_viewer/routes.dart';

class CategoryViewModel with ChangeNotifier {

  int pageCount = 0;
  List<MdPage> pages = [];

  Future<bool> loadPageNames(Object? args) async {
    try {
      final category = (args as Map<String, String>?)?['category'] ?? '';
      pages = await MdLoader.loadPages(category);
      pageCount = pages.length;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  void loadPage(BuildContext context, int index) {
    Navigator.pushNamed(
      context,
      Pages.markdown,
      arguments: {
        'pageUrl': pages[index].pageUrl,
      },
    );
  }

}