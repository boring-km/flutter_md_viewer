import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/views/category/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args = ModalRoute.of(context)!.settings.arguments;
      final viewModel = context.read<CategoryViewModel>();
      viewModel.loadPageNames(args).then((isSuccess) {
        if (!isSuccess) {
          print('error');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final viewModel = context.watch<CategoryViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: height / 2,
            child: ListView.builder(
              itemCount: viewModel.pageCount,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    viewModel.loadPage(context, i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      color: Colors.deepOrangeAccent,
                      child: Text(viewModel.pages[i].pageUrl, style: TextStyle(color: Colors.black),),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
