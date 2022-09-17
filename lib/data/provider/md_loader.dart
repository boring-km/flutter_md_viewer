import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/core/file_utils.dart';
import 'package:flutter_md_viewer/data/model/page.dart';

class MdLoader {
  static final _loadedPageList = <MdPage>[];

  static Future<List<MdPage>> loadPages(
    String category, {
    String? indexFilePath,
  }) async {
    // 새로 불러오기 위함
    _loadedPageList.clear();

    final indexFile =
        await rootBundle.loadString(indexFilePath ?? './page_index.md');
    for (final fileString in findFiles(indexFile)) {
      final pageUrl = removeBracket(fileString);
      if (category == getCategory(pageUrl)) {
        _loadedPageList.add(
          MdPage(
            category: category,
            pageUrl: pageUrl,
          ),
        );
      }
    }
    return _loadedPageList;
  }

  static Future<String> loadPage(String pageUrl) async {
    return rootBundle.loadString(pageUrl);
  }
}
