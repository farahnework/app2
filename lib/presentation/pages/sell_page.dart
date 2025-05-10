import 'package:app/presentation/widgets/custom_button.dart';
import 'package:app/presentation/widgets/custom_drop_down.dart';
import 'package:app/presentation/widgets/custom_icon_button.dart';
import 'package:app/presentation/widgets/custom_icon_text_button.dart';
import 'package:app/presentation/widgets/custom_search_field.dart';
import 'package:app/presentation/widgets/sell_product_card.dart';
import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
      color: AppColors.white,
    //   boxShadow: [
    //   BoxShadow(
    //     color: Colors.grey.withAlpha(100),
    //     spreadRadius: 1,
    //     blurRadius: 10,
    //     offset: Offset(0, 1), // Changes position of shadow
    //   ),
    // ],
        border: Border(bottom: BorderSide(color: AppColors.grey)),

      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tareq Erq'),
            Row(children: [
              Text('الوردية الرئيسية'),
              Text('الوردية الحالية:'),
            ],),
            CustomIconButton(icon: Icons.add),

          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.screenPadding),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                CustomSearchField(),
                CustomDropDown(title: "المنتجات", list: [], selected: '', width: 0.1 ),
                Row(children: [
                  Text('برامج'),
                  Icon(Icons.home),
                ],),
              ],),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index){
                    return ProductCard();
                  })
            ],),
          ),),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              children:[
                Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('عميل عام'),
                        Icon(Icons.person, color: AppColors.darkPurple,),
                      ],
                    ),
                    Row(
                      children: [
                        CustomIconButton(icon: Icons.cancel_outlined),
                        CustomIconButton(icon: Icons.print),
                      ],
                    ),
                  ],
                ),
                 ListView.builder(itemBuilder: (context, index){
                   return SellProductCard(amount: 1, price: 2000, productName: "Asus Laptop");
                 })
              ],
              ),
                Column(children: [
                  Row(children: [
                    Image.asset(''),
                    Text('2000'),
                    Text('المجموع'),
                  ],),
                  Row(children: [
                    Image.asset(''),
                    Text('2000'),
                    Text('القيمة المضافة'),
                  ],),
                  Row(children: [
                    Image.asset(''),
                    Text('2000'),
                    Text('الاجمالي'),
                  ],),
                  CustomButton(text: 'عملية الدفع'),
                ],),
              ],
            ),
          ),
        ),
      ],
    );
  }
}