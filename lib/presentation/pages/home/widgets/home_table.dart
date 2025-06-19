import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/responsive/app_sizes.dart';

class HomeTable extends StatefulWidget {
  const HomeTable({super.key});

  @override
  State<HomeTable> createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white),
            width: context.screenWidth,
            child:
            context.isMobile?
             Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(
                      AppColors.lightPurple,
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          StringTranslateExtension('number').tr(),
                          style: CustomTextStyles.tableHeader(context),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          StringTranslateExtension('shift').tr(),
                          style: CustomTextStyles.tableHeader(context),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          StringTranslateExtension('device').tr(),
                          style: CustomTextStyles.tableHeader(context),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          StringTranslateExtension('status').tr(),
                          style: CustomTextStyles.tableHeader(context),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('balence').tr(),
                            style: CustomTextStyles.tableHeader(context),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '1',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Main Shift',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '11/2/2025',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Open',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '1000',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Main Shift',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '11/2/2025',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Open',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '1000',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '3',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            MouseRegion(
                              child: Text(
                                'Main Shift',
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.smallText(context),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '11/2/2025',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Open',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '1000',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ): Expanded(
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
                            StringTranslateExtension('number').tr(),
                            style: CustomTextStyles.tableHeader(context),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('shift').tr(),
                            style: CustomTextStyles.tableHeader(context),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('device').tr(),
                            style: CustomTextStyles.tableHeader(context),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('status').tr(),
                            style: CustomTextStyles.tableHeader(context),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('balance').tr(),
                       
                            style: CustomTextStyles.tableHeader(context),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '1',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Main Shift',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '11/2/2025',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Open',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '1000',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Main Shift',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '11/2/2025',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Open',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '1000',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '3',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            MouseRegion(
                              child: Text(
                                'Main Shift',
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.smallText(context),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '11/2/2025',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Open',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
                          DataCell(
                            Text(
                              '1000',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.smallText(context),
                            ),
                          ),
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
