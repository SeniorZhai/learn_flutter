import 'package:Bandage/speed_code/shop/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/shop/icons/back.svg',
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/shop/icons/search.svg',
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/shop/icons/cart.svg',
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      body: DetailsBody(
        product: product,
      ),
    );
  }
}
