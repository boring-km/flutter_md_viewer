import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/core/file_utils.dart';

class CategoryLoader {

  static Future<List<String>> getCategories({String? indexPath}) async {
    final results = <String>[];
    final indexFile = await rootBundle.loadString(indexPath ?? './page_index.md');

    for (final fileData in findCategories(indexFile)) {
      final category = removeStars(fileData);
      if (category.isNotEmpty) {
        results.add(category);
      }
    }
    return results;
  }
}
