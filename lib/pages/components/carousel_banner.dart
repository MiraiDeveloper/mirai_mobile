import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widget/banner_image.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.8,
          enlargeCenterPage: true,
        ),
        items: imgList
            .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0)
                  ],
                )),
          ),
        ))
            .toList(),
      ),
    );
  }
}
