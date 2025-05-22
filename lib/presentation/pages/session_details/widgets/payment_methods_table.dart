import 'package:app/presentation/pages/session_details/widgets/custom_data_cell.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class PaymentMethodsTable extends StatefulWidget {
  const PaymentMethodsTable({super.key});

  @override
  State<PaymentMethodsTable> createState() => _PaymentMethodsTableState();
}

class _PaymentMethodsTableState extends State<PaymentMethodsTable> {
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
                    headingRowColor: MaterialStateProperty.all(
                      AppColors.lightPurple,
                    ),
                    columns: [
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Payment Method',
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Total",
                            style: CustomTextStyles.tableHeader,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                            customDataCell('Cash', false, true),
                          customDataCell('600', true, false),
                        ],
                      ),
                      DataRow(
                        cells: [
                            customDataCell('Card', false, true),
                          customDataCell('20000', true, false),
                        ],
                      ),
                      DataRow(
                        cells: [
                           customDataCell('Debt', false, true),
                          customDataCell('600', true, false),
                        ],
                      ),
                      DataRow(
                        cells: [
                           customDataCell('Total', false, true),
                          customDataCell('120000', true, false),
                         
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
