// ignore_for_file: require_trailing_commas

import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/data/md_loader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('모든 Markdown 파일을 불러와서 테스트 md 파일이 잘 불러와졌는지 테스트', () async {
    final testFiles = await MdLoader.getFiles();

    for (var i = 0; i < testFiles.length; i++) {
      final target = testFiles[i];
      final expected = await rootBundle.loadString('./pages/test${i + 1}.md');
      expect(target, expected);
    }
  });
}
