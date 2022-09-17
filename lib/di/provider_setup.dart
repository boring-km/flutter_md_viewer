import 'package:flutter_md_viewer/views/category/category_view_model.dart';
import 'package:flutter_md_viewer/views/home/home_view_model.dart';
import 'package:flutter_md_viewer/views/markdown/markdown_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final homeViewModel = HomeViewModel();
  final categoryViewModel = CategoryViewModel();
  final markdownViewModel = MarkdownViewModel();

  return [
    ChangeNotifierProvider(create: (_) => homeViewModel,),
    ChangeNotifierProvider(create: (_) => categoryViewModel,),
    ChangeNotifierProvider(create: (_) => markdownViewModel),
  ];
}
