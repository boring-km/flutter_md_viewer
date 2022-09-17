import 'package:flutter/foundation.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';

class MarkdownViewModel extends ChangeNotifier {
  MarkdownViewModel() {

    loadPages();
  }
  String file = '';

  Future<void> loadPages() async {
    file = (await MdLoader.getFiles())[0];
    notifyListeners();
  }
}
