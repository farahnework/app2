import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class KitchenOrderCard extends StatelessWidget {
  final String orderId;
  final String type;
  final List<Map<String, dynamic>> items; // List of ordered items
  final Color backgroundColor;

  const KitchenOrderCard({
    super.key,
    required this.orderId,
    required this.type,
    required this.items,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
      child: Container(
        decoration: CustomBoxDecoration.boxDecoration.copyWith(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
        ),
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Details (Header)
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.screenPadding / 2,
                vertical: AppSizes.screenPadding / 3,
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(orderId, style: TextStyle(fontSize: AppSizes.fontSize2, fontWeight: FontWeight.w700)),
                  Text(type, style: TextStyle(fontSize: AppSizes.fontSize2, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            
            // Ordered Items
            Column(
              children: items.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.screenPadding / 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [   
                      Text("${item['quantity']}x", style: TextStyle(fontSize: AppSizes.fontSize2, fontWeight: FontWeight.bold)),
                      Text(item['name'], style: TextStyle(fontSize: AppSizes.fontSize2)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
