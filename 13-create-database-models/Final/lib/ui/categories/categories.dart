import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dialog/new_item.dart';
import '../utils.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  ConsumerState<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          getCategories(),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: startGradientColor,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                showNewDialog('New Category', (String? name) async {
                  if (name != null) {
                    // TODO Add Category
                    setState(() {
                    });
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void showNewDialog(String title, NameCallBack callBack) {
    showDialog(
      context: context,
      builder: (context) => NewItemDialog(
        title: title,
        callBack: callBack,
      ),
    );
  }
  Future<List<String>> getFakeCategories() {
    return Future.value(<String>[]);
  }

  Widget getCategories() {
    // TODO Watch for database changes

    return FutureBuilder<List<String>>(
      // TODO Retrieve categories
      future: getFakeCategories(),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        // TODO get Categories
        return ListView.builder(
          // TODO Use Categories
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {
            // TODO Use Category
            return buildCategoryRow('Test');
          },
        );
      },
    );
  }

  // TODO Use Categories
  Widget buildCategoryRow(String category) {
    // TODO Watch for database changes
    return Card(
      color: startGradientColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              // TODO Use Categories
              category,
              style: largeWhiteText,
            ),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  // TODO Delete Category
                  setState(() {});
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
