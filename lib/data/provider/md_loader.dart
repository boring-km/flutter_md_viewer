import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/core/file_utils.dart';
import 'package:flutter_md_viewer/data/model/page.dart';

class MdLoader {
  static const _indexFilePath = './page_index.md';
  static final _loadedPageList = <MdPage>[];

  static Future<List<MdPage>> loadPages() async {
    // 새로 불러오기 위함
    _loadedPageList.clear();

    final indexFile = await rootBundle.loadString(_indexFilePath);
    for (final fileString in findFiles(indexFile)) {
      final page = removeBracket(fileString);
      _loadedPageList.add(
        MdPage(
          category: getCategory(page),
          markdownContent: await rootBundle.loadString(page),
        ),
      );
    }
    return _loadedPageList;
  }

  Future<List<MdPage>> getFilesWithCategory(String category) async {
    final resultList = <MdPage>[];
    for (final page in _loadedPageList) {
      if (page.category == category) {
        resultList.add(page);
      }
    }
    return resultList;
  }
}
