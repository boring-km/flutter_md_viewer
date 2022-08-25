import 'package:flutter/foundation.dart';
import 'package:flutter_md_viewer/data/md_loader.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    _loadPages();
  }

  Future<List<String>> _loadPages() async {
    return MdLoader.getFiles();
  }
}
