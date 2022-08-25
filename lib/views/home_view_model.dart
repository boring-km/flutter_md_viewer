import 'package:flutter/foundation.dart';
import 'package:flutter_md_viewer/data/md_loader.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    loadPages();
  }
  List<String> files = [];

  Future<void> loadPages() async {
    files = await MdLoader.getFiles();
    notifyListeners();
  }
}
