import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class HomeTable extends StatelessWidget {
  const HomeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white),
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(
                      AppColors.lightPurple,
                    ),
                    columns: [
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Number',
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Shift",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Device',
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Status",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Balance",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('1', textAlign: TextAlign.center)),
                          DataCell(
                            Text('Main Shift', textAlign: TextAlign.center),
                          ),
                          DataCell(
                            Text('11/2/2025', textAlign: TextAlign.center),
                          ),
                          DataCell(Text('Open', textAlign: TextAlign.center)),
                          DataCell(Text('1000', textAlign: TextAlign.center)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('2', textAlign: TextAlign.center)),
                          DataCell(
                            Text('Main Shift', textAlign: TextAlign.center),
                          ),
                          DataCell(
                            Text('11/2/2025', textAlign: TextAlign.center),
                          ),
                          DataCell(Text('Open', textAlign: TextAlign.center)),
                          DataCell(Text('1000', textAlign: TextAlign.center)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('3', textAlign: TextAlign.center)),
                          DataCell(
                            MouseRegion(
                              child: Text(
                                'Main Shift',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataCell(
                            Text('11/2/2025', textAlign: TextAlign.center),
                          ),
                          DataCell(Text('Open', textAlign: TextAlign.center)),
                          DataCell(Text('1000', textAlign: TextAlign.center)),
                        ],
                      ),
                    ],
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