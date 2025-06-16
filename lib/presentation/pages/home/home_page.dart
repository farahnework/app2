import 'package:app/controllers/side_bar_controller.dart';
import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:app/core/responsive/screen_layouts.dart';
import 'package:app/presentation/pages/home/widgets/home_app_bar.dart';
import 'package:app/presentation/pages/home/widgets/home_table.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/widgets/bars/icon_side_bar.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_text_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Provider.of<SideBarController>(
      context,
      listen: false,
    ).setScaffoldKey(scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    if (!context.isMobile) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        drawer: context.isDesktop ? null : SideBar(),

        backgroundColor: AppColors.lightGrey,
        body: Row(
          children: [
            context.isDesktop
                ? Expanded(flex: 1, child: SideBar())
                : context.isLargeTablet
                ? IconSideBar()
                : context.isSmallTablet
                ? IconSideBar()
                : Container(),

            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [HomeAppBar(), HomeBody()],
              ),
            ),
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
    int crossAxisCount =
        context.isMobile
            ? ScreenLayouts.mobileCrossAxisCount
            : ResponsiveSizing.isTablet(context)
            ? ScreenLayouts.tabletCrossAxisCount
            : 4;

    double spacing =
        context.isMobile
            ? ScreenLayouts.mobileSpacing
            : ResponsiveSizing.isTablet(context)
            ? ScreenLayouts.tabletSpacing
            : ScreenLayouts.desktopSpacing;

    double childAspectRatio =
        context.isMobile
            ? 1.5
            : ResponsiveSizing.isTablet(context)
            ? 1.5
            : 1.7;

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsivePadding(AppSizes.horizontalPadding),
            vertical: AppSizes.verticalPadding,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: spacing ,
                    mainAxisSpacing: spacing,
                    childAspectRatio: childAspectRatio,
                  ),
                  children: [
                    Expanded(
                      child: CustomServiceCard(
                        color: AppColors.lightGreen,
                        icon: IconsaxPlusLinear.money_recive,
                        text: "Income",
                        number: '25450',
                        iconAppear: true,
                        iconColor: AppColors.darkGreen,
                      ),
                    ),
                    Expanded(
                      child: CustomServiceCard(
                        color: AppColors.lightPurple,
                        icon: IconsaxPlusLinear.receipt_1,
                        text: "Invoices",
                        number: '512',
                        iconAppear: false,
                        iconColor: AppColors.darkPurple,
                      ),
                    ),

                    Expanded(
                      child: CustomServiceCard(
                        color: AppColors.lightBlue,
                        icon: IconsaxPlusLinear.people,
                        text: "Total Customers",
                        number: '14',
                        iconAppear: false,
                        iconColor: AppColors.darkBlue,
                      ),
                    ),

                    Expanded(
                      child: CustomServiceCard(
                        color: AppColors.lightYellow,
                        icon: IconsaxPlusLinear.user,
                        text: "New Customers",
                        number: '14',
                        iconAppear: false,
                        iconColor: AppColors.yellow,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSizes.verSpacesBetweenContainers),
              CustomContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rigesters',
                          style: CustomTextStyles.titleText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    context.isMobile
                        ? Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomDropDownButton(
                                    icon: IconsaxPlusLinear.tag,
                                    color: AppColors.white,
                                    title: "Shift",
                                    list: ["Any Shift", "Main Shift"],
                                    selected: 'Any Shift',
                                    width: 200,
                                    height: AppSizes.widgetHeight,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.horiSpacesBetweenElements,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomDropDownButton(
                                    icon: IconsaxPlusLinear.tag,
                                    color: AppColors.white,
                                    title: "Device",
                                    list: [
                                      "Any Device",
                                      "Device 1",
                                      'Device 2',
                                    ],
                                    selected: 'اي جهاز',
                                    width: 200,
                                    height: AppSizes.widgetHeight,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.horiSpacesBetweenElements,
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: CustomDropDownButton(
                                    icon: IconsaxPlusLinear.tag,
                                    color: AppColors.white,
                                    title: "Status",
                                    list: [
                                      " Any Status ",
                                      "Status 2",
                                      'Status1 ',
                                    ],
                                    selected: " Any Status ",
                                    width: 200,
                                    height: AppSizes.widgetHeight,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.horiSpacesBetweenElements,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomIconTextButton(
                                    text: 'Search',
                                    icon: IconsaxPlusLinear.search_normal_1,
                                    page: SellPage(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDropDownButton(
                                  icon: IconsaxPlusLinear.tag,
                                  color: AppColors.white,
                                  title: "Shift",
                                  list: ["Any Shift", "Main Shift"],
                                  selected: 'Any Shift',
                                  width: 200,
                                  height: AppSizes.widgetHeight,
                                ),
                                SizedBox(
                                  width: AppSizes.horiSpacesBetweenElements,
                                ),
                                CustomDropDownButton(
                                  icon: IconsaxPlusLinear.tag,
                                  color: AppColors.white,
                                  title: "Device",
                                  list: ["Any Device", "Device 1", 'Device 2'],
                                  selected: 'اي جهاز',
                                  width: 200,
                                  height: AppSizes.widgetHeight,
                                ),
                                SizedBox(
                                  width: AppSizes.horiSpacesBetweenElements,
                                ),

                                CustomDropDownButton(
                                  icon: IconsaxPlusLinear.tag,
                                  color: AppColors.white,
                                  title: "Status",
                                  list: [
                                    " Any Status ",
                                    "Status 2",
                                    'Status1 ',
                                  ],
                                  selected: " Any Status ",
                                  width: 200,
                                  height: AppSizes.widgetHeight,
                                ),
                              ],
                            ),
                            CustomIconTextButton(
                              text: 'Search',
                              icon: IconsaxPlusLinear.search_normal_1,
                              page: SellPage(),
                            ),
                          ],
                        ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    HomeTable(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomServiceCard extends StatefulWidget {
  final Color color;
  final Color iconColor;
  final IconData icon;
  final String text;
  final String number;
  final bool iconAppear;
  const CustomServiceCard({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.number,
    required this.iconAppear,
    required this.iconColor,
  });

  @override
  State<CustomServiceCard> createState() => _CustomServiceCardState();
}

class _CustomServiceCardState extends State<CustomServiceCard> {
  var currentColor = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.darkPurple;
        });
      },

      onExit: (event) {
        setState(() {
          currentColor = AppColors.grey;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.responsivePadding(AppSizes.verticalPadding),
          horizontal: context.responsivePadding(AppSizes.horizontalPadding),
        ),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(context.responsiveIconSize(AppSizes.radius16)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              size: context.responsiveIconSize(30),
              widget.icon,
              color: widget.iconColor,
            ),
            SizedBox(width: context.responsiveSpacing(AppSizes.horiSpacesBetweenElements)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.iconAppear
                        ? SvgPicture.asset(
                          AppImages.rial,
                          height: context.responsiveFontSize(
                            AppSizes.fontSize2,
                          ),
                        )
                        : SizedBox(),
                    widget.iconAppear
                        ? SizedBox(width: AppSizes.horiSpacesBetweentTexts)
                        : SizedBox(),
                    Text(
                      widget.number,
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(
                          AppSizes.fontSize1,
                        ),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: AppColors.darkGray,
                    fontSize: context.responsiveFontSize(AppSizes.fontSize3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
