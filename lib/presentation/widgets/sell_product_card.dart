import 'package:app/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class SellProductCard extends StatefulWidget {
  final double amount;
  final double price;
  final String productName;
   SellProductCard({super.key, required this.amount, required this.price, required this.productName});

  @override
  State<SellProductCard> createState() => _SellProductCardState();
}

class _SellProductCardState extends State<SellProductCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.cancel, color: AppColors.red,),
        Text((widget.price * widget.amount) as String),
        CustomDropDownButton(title: 'حبة', list: ["كيلو","حبة"], selected: 'حبة', width: 0.2),
        Text(widget.amount.toString()),
        Text(widget.price.toString()),
        Text(widget.productName),
      ],
    );
  }
}
