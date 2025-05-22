import 'package:app/presentation/pages/session_details/widgets/custom_data_cell.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class SessionDetailsTable extends StatefulWidget {
  const SessionDetailsTable({super.key});

  @override
  State<SessionDetailsTable> createState() => _SessionDetailsTableState();
}

class _SessionDetailsTableState extends State<SessionDetailsTable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              border: Border.all(color: AppColors.lightPurple),

              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 0.5),
                  color: AppColors.darkPurple.withOpacity(0.05),
                  spreadRadius: 1,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                  child: DataTable(
                    // showBottomBorder: true,
                    headingRowColor: MaterialStateProperty.all(
                      AppColors.lightPurple,
                    ),
                    columns: [
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Shift',
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Shift Number",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Opening Time',
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Device",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Employee",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Closing Time",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          customDataCell('Main Shift', false, false),
                          customDataCell('2', false, false),
                          customDataCell('11/2/2025 10:20', false, false),
                          customDataCell('Device 1', false, false),
                          customDataCell('Mohammed', false, false),
                          customDataCell('-', false, false),
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
