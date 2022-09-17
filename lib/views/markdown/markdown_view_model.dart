import 'package:flutter/foundation.dart';
import 'package:flutter_md_viewer/data/model/page.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';

class MarkdownViewModel extends ChangeNotifier {

  MarkdownViewModel() {
    pageList = MdLoader.loadPages();
  }

  Future<List<MdPage>>? pageList;
  String content = '';

  Future<void> loadPages() async {
    content = (await pageList!)[0].markdownContent;
    notifyListeners();
  }
}
