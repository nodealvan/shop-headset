import 'package:flutter/material.dart';
import '../../../constants.dart';

class Categories extends StatefulWidget {
  final ValueChanged<int> onCategorySelected;
  final int initialIndex;
  final List<String> categories;

  const Categories({
    super.key,
    required this.onCategorySelected,
    this.initialIndex = 0,
    required this.categories,
  });
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 31,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) => _buildCategory(index),
        ),
      ),
    );
  }

  Widget _buildCategory(int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onCategorySelected(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: isSelected ? Colors.blue : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
