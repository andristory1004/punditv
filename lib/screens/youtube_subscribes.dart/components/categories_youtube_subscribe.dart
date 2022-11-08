import 'package:flutter/material.dart';

class CategoriesYoutubeSubscribe extends StatelessWidget {
  const CategoriesYoutubeSubscribe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    FilterChip(label: Text('Music'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    FilterChip(label: Text('Games'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: FilterChip(label: Text('Alam'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    FilterChip(label: Text('Animasi'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    FilterChip(label: Text('Animal'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    FilterChip(label: Text('Cooking'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    FilterChip(label: Text('Music'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: FilterChip(
                    label: Text('Programming'), onSelected: (value) {})),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: FilterChip(
                    label: Text('Mobile Developer'), onSelected: (value) {})),
          ],
        ),
      ),
    );
  }
}
