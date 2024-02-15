import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_project/models/product_response/product_response.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductFlipCard extends StatelessWidget {
  final ProductResponse product;
  final int index;

  const ProductFlipCard(
      {super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      front: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
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
                height: 200,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
      back: Container(
        child: Column(
          children: [Text(product.title!), Text(product.description!)],
        ),
      ),
    );
  }
}
