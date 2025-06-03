import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

import 'orientation_layout.dart';
import 'responsive_helper.dart';

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Design Example',
            style: context.textTheme.titleMedium),
        elevation: 0,
      ),
      body: ScreenTypeLayout(
        // Mobile layout
        mobile: _buildMobileLayout(context),
        // Tablet layout
        tablet: _buildTabletLayout(context),
        // Desktop layout
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return OrientationLayout(
      portrait: _buildMobilePortraitContent(context),
      landscape: _buildMobileLandscapeContent(context),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return OrientationLayout(
      portrait: _buildTabletPortraitContent(context),
      landscape: _buildTabletLandscapeContent(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return _buildDesktopContent(context);
  }

  // Mobile layouts
  Widget _buildMobilePortraitContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.responsiveEdgeInsets(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile Portrait Layout',
              style: TextStyle(
                fontSize: context.responsiveFontSize(18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.responsiveVerticalSpacing),
            _buildInfoCard(context),
            SizedBox(height: context.responsiveVerticalSpacing),
            _buildGridItems(context, crossAxisCount: 2),
            SizedBox(height: context.responsiveVerticalSpacing),
            _buildActionButtons(context, isStacked: true),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLandscapeContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.responsiveEdgeInsets(),
        child: Column(
          children: [
            Text(
              'Mobile Landscape Layout',
              style: TextStyle(
                fontSize: context.responsiveFontSize(18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.responsiveVerticalSpacing),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildInfoCard(context),
                ),
                SizedBox(width: context.responsiveHorizontalSpacing),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _buildGridItems(context, crossAxisCount: 3),
                      SizedBox(height: context.responsiveVerticalSpacing),
                      _buildActionButtons(context, isStacked: false),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Tablet layouts
  Widget _buildTabletPortraitContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.responsiveEdgeInsets(
          horizontal: AppSizes.spacing24,
          vertical: AppSizes.spacing16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tablet Portrait Layout',
              style: TextStyle(
                fontSize: context.responsiveFontSize(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.responsiveVerticalSpacing),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildInfoCard(context),
                ),
                SizedBox(width: context.responsiveHorizontalSpacing),
                Expanded(
                  flex: 1,
                  child: _buildActionButtons(context, isStacked: true),
                ),
              ],
            ),
            SizedBox(height: context.responsiveVerticalSpacing),
            _buildGridItems(context, crossAxisCount: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLandscapeContent(BuildContext context) {
    return Padding(
      padding: context.responsiveEdgeInsets(
        horizontal: AppSizes.spacing24,
        vertical: AppSizes.spacing16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tablet Landscape Layout',
            style: TextStyle(
              fontSize: context.responsiveFontSize(22),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.responsiveVerticalSpacing),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildInfoCard(context),
                      SizedBox(height: context.responsiveVerticalSpacing),
                      _buildActionButtons(context, isStacked: false),
                    ],
                  ),
                ),
                SizedBox(width: context.responsiveHorizontalSpacing),
                Expanded(
                  flex: 2,
                  child: _buildGridItems(context, crossAxisCount: 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Desktop layout
  Widget _buildDesktopContent(BuildContext context) {
    return Padding(
      padding: context.responsiveEdgeInsets(
        horizontal: AppSizes.horizontalPadding,
        vertical: AppSizes.spacing24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Desktop Layout',
            style: TextStyle(
              fontSize: context.responsiveFontSize(28),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.responsiveVerticalSpacing),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.responsiveWidth(percentage: 25),
                  child: Column(
                    children: [
                      _buildInfoCard(context),
                      SizedBox(height: context.responsiveVerticalSpacing),
                      _buildActionButtons(context, isStacked: true),
                    ],
                  ),
                ),
                SizedBox(width: context.responsiveHorizontalSpacing),
                Expanded(
                  child: _buildGridItems(context, crossAxisCount: 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable components
  Widget _buildInfoCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.responsivePadding(AppSizes.spacing16)),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          context.responsiveBorderRadius(AppSizes.radius8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Info Card',
            style: TextStyle(
              fontSize: context.responsiveFontSize(18),
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: context.responsiveSpacing(AppSizes.spacing8)),
          Text(
            'This card demonstrates responsive sizing and spacing. It adapts to different screen sizes and orientations.',
            style: TextStyle(
              fontSize: context.responsiveFontSize(14),
              color: AppColors.black,
            ),
          ),
          SizedBox(height: context.responsiveSpacing(AppSizes.spacing16)),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: context.responsiveIconSize(20),
              ),
              SizedBox(width: context.responsiveSpacing(AppSizes.spacing8)),
              Text(
                'Resize to see adaptations',
                style: TextStyle(
                  fontSize: context.responsiveFontSize(14),
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItems(BuildContext context, {required int crossAxisCount}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0,
        crossAxisSpacing: context.responsiveSpacing(AppSizes.spacing8),
        mainAxisSpacing: context.responsiveSpacing(AppSizes.spacing8),
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              context.responsiveBorderRadius(AppSizes.radius8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.widgets_outlined,
                color: AppColors.primary,
                size: context.responsiveIconSize(24),
              ),
              SizedBox(height: context.responsiveSpacing(AppSizes.spacing8)),
              Text(
                'Item ${index + 1}',
                style: TextStyle(
                  fontSize: context.responsiveFontSize(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context, {required bool isStacked}) {
    final buttonWidth = isStacked
        ? double.infinity
        : context.responsiveWidth(
            percentage: context.isDesktop
                ? 15
                : context.isTablet
                    ? 20
                    : 30);

    final List<(String, IconData)> buttons = [
      ('Action 1', Icons.add),
      ('Action 2', Icons.edit),
      ('Action 3', Icons.delete),
    ];

    return isStacked
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons.map((button) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: context.responsiveSpacing(AppSizes.spacing8),
                ),
                child: _buildButton(
                  context,
                  label: button.$1,
                  icon: button.$2,
                  width: buttonWidth,
                ),
              );
            }).toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: buttons.map((button) {
              return _buildButton(
                context,
                label: button.$1,
                icon: button.$2,
                width: buttonWidth,
              );
            }).toList(),
          );
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required double width,
  }) {
    return Container(
      width: width,
      height: context.responsiveWidgetHeight,
      margin: EdgeInsets.symmetric(
        horizontal: context.responsiveSpacing(AppSizes.spacing4),
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          size: context.responsiveIconSize(20),
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: context.responsiveFontSize(14),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              context.responsiveBorderRadius(AppSizes.radius8),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSpacing(AppSizes.spacing16),
          ),
        ),
      ),
    );
  }
}
