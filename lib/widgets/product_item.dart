import 'package:flutter/material.dart';
import 'package:foody/models/Product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.mostRatedProductList});

  final Product mostRatedProductList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 120,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.network(
                      width: 120,
                      height: 120,
                      mostRatedProductList.thumbnail_img ?? '',
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor:
                        Colors.deepOrange,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8),
                child: Text(
                  mostRatedProductList.name ?? 'Not Found',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8),
                child: Row(
                  children: [
                    Text('Details  '),
                    Text(
                      '4.5',
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: 15,
                    ),
                    Text(
                        '100'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
