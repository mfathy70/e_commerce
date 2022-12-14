import 'package:e_commerce/model/category.dart';
import 'package:e_commerce/UI/screens/Categories%20Screen/catigories_screen.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/catigories/catigory.dart';
import 'package:flutter/material.dart';

class CatigoriesWidget extends StatelessWidget {
  const CatigoriesWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Order now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 18, color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 330,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              mainAxisExtent: 115.0,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              Category categoriesList = categories[index];
              return GestureDetector(
                child: Catigory(
                  image: categoriesList.image,
                  name: categoriesList.label,
                ),
                onTap: () {
                  print(index.toInt());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatigoriesScreen(
                                currentPage: index.toInt(),
                              )));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
