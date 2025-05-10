import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
shape: StadiumBorder(side: BorderSide(color: AppColors.grey,),
),
      child: Column(
        children: [
      Image(image: AssetImage('lib/assets/images/logo.png'),),
          Text('jjjjjj'),
          Row(children: [
            Image.asset(''),
            Text('2555'),
          ],)
        ],
      ),
    );
  }
}
