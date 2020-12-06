import 'package:Bandage/speed_code/shop/components/details_screen.dart';
import 'package:Bandage/speed_code/shop/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body.dart';
import 'constants.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/shop/icons/back.svg"),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/shop/icons/search.svg",
              color: kTextColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            color: kTextColor,
            icon: SvgPicture.asset(
              "assets/shop/icons/cart.svg",
              color: kTextColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
