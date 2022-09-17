
import 'package:flutter/foundation.dart';
import 'package:flutter_md_viewer/data/provider/category_loader.dart';

class HomeViewModel with ChangeNotifier {

  HomeViewModel() {
    getCategories();
  }

  List<String> categoryList = [];

  Future<void> getCategories() async {
    categoryList = await CategoryLoader.getCategories();
    notifyListeners();
  }

}
