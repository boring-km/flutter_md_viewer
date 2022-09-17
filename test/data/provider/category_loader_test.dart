import 'package:flutter_md_viewer/data/provider/category_loader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  test('카테고리 리스트 가져오기', () async {
    final actual = await CategoryLoader.getCategories(indexPath: './page_test_index.md');
    
    final matcher = ['test', 'test2'];

    expect(actual, matcher);
  });
}