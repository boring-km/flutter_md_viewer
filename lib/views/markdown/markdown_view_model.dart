import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';
import 'package:flutter_md_viewer/routes.dart';

class MarkdownViewModel extends ChangeNotifier {

  String content = '';

  Future<bool> loadPage(Object? args) async {
    try {
      final pageUrl = (args as Map?)?['pageUrl'] as String? ?? '';
      content = await MdLoader.loadPage(pageUrl.replaceAll('_', '/'));
      notifyListeners();
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  void goBack(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Pages.home,
    );
  }
}
