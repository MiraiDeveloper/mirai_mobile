import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirai_app/pages/components/carousel_banner.dart';
import 'package:mirai_app/pages/components/carousel_brand.dart';
import 'package:mirai_app/pages/components/navbar.dart';
import 'package:mirai_app/pages/components/product_tile.dart';
import 'package:mirai_app/shared/theme.dart';

import 'components/carousel_category.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                          left: 24, top: 20, right: 24, bottom: 20),
                      child: Text(
                        'Hi, Budi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, top: 20, right: 24, bottom: 20),
                      child: Icon(
                        Icons.favorite_border,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                  child: CupertinoSearchTextField(
                    
                  ),
                ),
                const CarouselBanner(),
                const CarouselBrand(),
                const CarouselCategory(),
                const ProductsTile(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Center(
                      child: Text(
                        "Mirai Dev @2022",
                        style: TextStyle(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
