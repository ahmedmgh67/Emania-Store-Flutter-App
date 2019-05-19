import 'package:flutter/material.dart';
import 'package:emania/data.dart';
import 'package:emania/widgets/category_card.dart';

class CategoryCardScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getCategories().length,
            itemBuilder: (context, index) =>
                CategoryCard(getCategories()[index], index),
          ),
        ));
  }
}
