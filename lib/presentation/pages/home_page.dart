import 'package:app/presentation/pages/sell_page.dart';
import 'package:app/presentation/widgets/custom_app_bar.dart';
import 'package:app/presentation/widgets/custom_button.dart';
import 'package:app/presentation/widgets/custom_icon_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/presentation/widgets/custom_drop_down.dart';
import 'package:app/presentation/widgets/custom_outlined_button.dart';
import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: Stack(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  child: Column(children: [HomeBody()]),
                ),
              ),
            ),
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            container1(),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            container2(),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            container3(),
          ],
        ),
      ),
    );
  }
}

Widget container1() {
  return CustomContainer(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(text: 'جلسة جديدة', icon: Icons.add, onPressed:SellPage),
        Text('بحث', style: CustomTextStyles.header),
      ],
    ),
  );
}

Widget container2() {
  return CustomContainer(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropDown(
              title: "الوردية",
              list: ["اي وردية", "الوردية الرئيسية"],
              selected: 'اي وردية',
            ),
            CustomDropDown(
              title: "الجهاز",
              list: ["جهاز 2", "جهاز 1", 'اي جهاز'],
              selected: 'اي جهاز',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropDown(
              title: "رقم الجلسة",
              list: ["جهاز 2", "جهاز 1", 'اي جهاز'],
              selected: 'اي جهاز',
            ),
            CustomDropDown(
              title: "الحالة",
              list: ["حالة 2", " حالة1", 'اي حالة'],
              selected: 'اي حالة',
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements),
        Row(
          children: [
            CustomButton(text: 'بحث'),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            CustomOutlinedButton(text: 'إلغاء الفلتر'),
          ],
        ),
      ],
    ),
  );
}

Widget container3() {
  return CustomContainer(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('النتائج', style: CustomTextStyles.header)],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements),
        CustomTable(),
      ],
    ),
  );
}

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
                border: Border.all(color: AppColors.darkPurple),
              ),
               width: MediaQuery.of(context).size.width * 0.9,
              child: Expanded(
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(
                        AppColors.darkPurple,
                      ), 
                      columns: [
                        DataColumn(
                          label: Center(
                            child: Text(
                              "الحالة",
                              style: CustomTextStyles.tableHeader,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              "ملخصات البيع",
                              style: CustomTextStyles.tableHeader,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              "اسم الوردية",
                              style: CustomTextStyles.tableHeader,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              "اسم الوردية",
                              style: CustomTextStyles.tableHeader,
                            ),
                          ),
                        ),
                  
                        DataColumn(
                          label: Center(
                            child: Text(
                              'رقم الجلسة',
                              style: CustomTextStyles.tableHeader,
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(Text('مفتوحة', textAlign: TextAlign.center)),
                            DataCell(Text('1000', textAlign: TextAlign.center)),
                            DataCell(
                              Text('11/2/2025', textAlign: TextAlign.center),
                            ),
                            DataCell(Text('الرئيسية', textAlign: TextAlign.center)),
                  
                            DataCell(Text('1', textAlign: TextAlign.center)),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('مفتوحة', textAlign: TextAlign.center)),
                            DataCell(Text('1000', textAlign: TextAlign.center)),
                            DataCell(
                              Text('11/2/2025', textAlign: TextAlign.center),
                            ),
                            DataCell(Text('الرئيسية', textAlign: TextAlign.center)),
                  
                            DataCell(Text('1', textAlign: TextAlign.center)),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('مفتوحة', textAlign: TextAlign.center)),
                            DataCell(Text('1000', textAlign: TextAlign.center)),
                            DataCell(
                              Text('11/2/2025', textAlign: TextAlign.center),
                            ),
                            DataCell(Text('الرئيسية', textAlign: TextAlign.center)),
                  
                            DataCell(Text('1', textAlign: TextAlign.center)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
