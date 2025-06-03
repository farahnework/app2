import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/session_details/widgets/custom_data_cell.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DetailOfPaymentTable extends StatefulWidget {
  const DetailOfPaymentTable({super.key});

  @override
  State<DetailOfPaymentTable> createState() => _DetailOfPaymentTableState();
}

class _DetailOfPaymentTableState extends State<DetailOfPaymentTable> {
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
                            'Payment Method',
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Sales",
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Payoff',
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            "Net",
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: <DataCell>[
                          customDataCell('Cash', false, true, context),
                          customDataCell('600', true, false, context),
                          customDataCell('600', true, false, context),
                          customDataCell('100000', true, true, context),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          customDataCell('Card', false, true, context),
                          customDataCell('600', true, false, context),
                          customDataCell('600', true, false, context),
                          customDataCell('100000', true, true, context),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          customDataCell('Debt', false, true, context),
                          customDataCell('600', true, false, context),
                          customDataCell('600', true, false, context),
                          customDataCell('100000', true, true, context),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          customDataCell('Total', false, true, context),
                          customDataCell('600', true, false, context),
                          customDataCell('600', true, false, context),
                          customDataCell('100000', true, true, context),
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
