import 'package:flutter/material.dart';

class Product {
  String image;
  List images;
  String name;
  String price;
  String shade;
  String description;
  String tokopedia;
  String shopee;

  Product({
    required this.image,
    required this.images,
    required this.name,
    required this.price,
    required this.shade,
    required this.description,
    required this.tokopedia,
    required this.shopee,
  });
}

List productList = [
  Product(
      image:
          "https://asset-a.grid.id/crop/0x0:0x0/700x0/photo/2020/06/19/2269184815.jpg",
      images: [
        "https://asset-a.grid.id/crop/0x0:0x0/700x0/photo/2020/06/19/2269184815.jpg",
        "https://pinhome-blog-assets-public.s3.amazonaws.com/2021/08/Implora-Urban-Lip-Cream-Matte-1.jpg",
        "http://risetcdn.jatimtimes.com/images/2019/10/31/Penggemar-Lipstik-Matte-Harga-Murah-Tapi-Berkulitas-Ini-Deretan-Produk-Lokal-Harga-Rp-20-Ribuan-15286b2d716015102.jpg",
      ],
      name:
          "LipstikLipstikLipstikLipstikLipstikLipstikLipstikLipstikLipstikLipstik",
      price: "Rp 15.000",
      shade: "Hijau",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      tokopedia: "https://www.tokopedia.com/",
      shopee: "https://www.shopee.co.id/"),
  Product(
      image:
          "https://cdn.artdeco.de/media/catalog/product/cache/28f1048acbc92877c33347b38bbdea5b/6/2/622d443a7bf502e5af69f2df62a56506fe113b1d_6950fe13_ba13_477c_a4a3_9aa31008c4e1-image_product_1645104943_1.jpg",
      images: [
        "https://cdn.artdeco.de/media/catalog/product/cache/28f1048acbc92877c33347b38bbdea5b/6/2/622d443a7bf502e5af69f2df62a56506fe113b1d_6950fe13_ba13_477c_a4a3_9aa31008c4e1-image_product_1645104943_1.jpg",
        "https://beautyparty.id/images/images/sascofficial.jpg",
        "https://images.f2fcdn.net/files/niken/focallure-superfine-eyeliner.jpg",
      ],
      name: "Eyeliner",
      price: "Rp 120.000",
      shade: "Biru",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      tokopedia: "https://www.tokopedia.com/",
      shopee: "https://www.shopee.co.id/"),
  Product(
      image:
          "https://cdn.artdeco.de/media/catalog/product/cache/28f1048acbc92877c33347b38bbdea5b/6/2/622d443a7bf502e5af69f2df62a56506fe113b1d_6950fe13_ba13_477c_a4a3_9aa31008c4e1-image_product_1645104943_1.jpg",
      images: [
        "https://cdn.artdeco.de/media/catalog/product/cache/28f1048acbc92877c33347b38bbdea5b/6/2/622d443a7bf502e5af69f2df62a56506fe113b1d_6950fe13_ba13_477c_a4a3_9aa31008c4e1-image_product_1645104943_1.jpg",
        "https://beautyparty.id/images/images/sascofficial.jpg",
        "https://images.f2fcdn.net/files/niken/focallure-superfine-eyeliner.jpg",
      ],
      name: "Eyeliner",
      price: "Rp 120.000",
      shade: "Biru",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      tokopedia: "https://www.tokopedia.com/",
      shopee: "https://www.shopee.co.id/"),
  Product(
      image:
          "https://cdn.artdeco.de/media/catalog/product/cache/28f1048acbc92877c33347b38bbdea5b/6/2/622d443a7bf502e5af69f2df62a56506fe113b1d_6950fe13_ba13_477c_a4a3_9aa31008c4e1-image_product_1645104943_1.jpg",
      images: [
        "https://cdn.artdeco.de/media/catalog/product/cache/28f1048acbc92877c33347b38bbdea5b/6/2/622d443a7bf502e5af69f2df62a56506fe113b1d_6950fe13_ba13_477c_a4a3_9aa31008c4e1-image_product_1645104943_1.jpg",
        "https://beautyparty.id/images/images/sascofficial.jpg",
        "https://images.f2fcdn.net/files/niken/focallure-superfine-eyeliner.jpg",
      ],
      name: "Eyeliner",
      price: "Rp 120.000",
      shade: "Biru",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      tokopedia: "https://www.tokopedia.com/",
      shopee: "https://www.shopee.co.id/"),
];
