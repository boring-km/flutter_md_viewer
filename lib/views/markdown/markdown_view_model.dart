import 'package:flutter/foundation.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';

class MarkdownViewModel extends ChangeNotifier {

  String content = '';

  Future<bool> loadPage(Object? args) async {
    try {
      final pageUrl = (args as Map<String, String>?)?['pageUrl'] ?? '';
      print('pageUrl: $pageUrl');
      content = await MdLoader.loadPage(pageUrl);
      notifyListeners();
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
}
