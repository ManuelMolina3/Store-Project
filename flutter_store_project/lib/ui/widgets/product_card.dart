import 'package:flutter/material.dart';
import 'package:flutter_store_project/models/product_response/product_response.dart';
import 'package:flutter_store_project/ui/pages/product_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final ProductResponse product;
  final int index;

  const ProductCard({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    int delay = 100 * index;
    return SizedBox(
      width: 150,
      height: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                      productId: product.id!,
                    )),
          );
        },
        onDoubleTap: () {},
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: product.image!,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(0.8)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
