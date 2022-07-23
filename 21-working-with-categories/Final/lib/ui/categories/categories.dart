import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../database/supa_database.dart';
import '../../models/categories.dart';
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
                    await ref
                        .read(supaBaseDatabaseProvider)
                        .addCategory(Category(name: name));
                    setState(() {});
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

  Widget getCategories() {
    final repository = ref.watch(supaBaseDatabaseProvider);
    return FutureBuilder<List<Category>>(
      future: repository.readAllCategories(),
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        final categories = snapshot.data ?? <Category>[];
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return buildCategoryRow(categories[index]);
          },
        );
      },
    );
  }

  Widget buildCategoryRow(Category category) {
    final repository = ref.watch(supaBaseDatabaseProvider);
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
              category.name,
              style: largeWhiteText,
            ),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  await repository.deleteCategory(category);
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
