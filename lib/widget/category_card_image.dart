import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  final String urlImage;

  const CategoryItem({
    required this.urlImage,
  });
}

List<CategoryItem> items = [
  CategoryItem(
    urlImage: 'assets/images/kategori_lipstik.png',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_foundation.png',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_mascara.png',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_blushon.png',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_lipmatte.png',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_eyebrow.png',
  ),
];

Widget categoryCard({required CategoryItem item}) => Container(
      width: 100,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(item.urlImage, fit: BoxFit.cover))),
          )
        ],
      ),
    );
