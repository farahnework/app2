import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/session_details/widgets/custom_data_cell.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
                  color: AppColors.darkPurple.withValues(alpha:  0.05),
                  spreadRadius: 1,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: SingleChildScrollView(
                
                scrollDirection: context.isMobile? Axis.horizontal: Axis.vertical,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                  child: DataTable(
                    // showBottomBorder: true,
                    headingRowColor: WidgetStateProperty
                    .all(
                      AppColors.lightPurple,
                    ),
                    columns: [
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('shift').tr(),
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                           StringTranslateExtension('shift_number').tr(),
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('opening_time').tr(),
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('device').tr(),
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            StringTranslateExtension('employee').tr(),
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                           StringTranslateExtension('closing_time').tr(),
                            style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          customDataCell('Main Shift', false, false, context),
                          customDataCell('2', false, false, context),
                          customDataCell('11/2/2025 10:20', false, false, context),
                          customDataCell('Device 1', false, false, context),
                          customDataCell('Mohammed', false, false, context),
                          customDataCell('-', false, false, context),
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
