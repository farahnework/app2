import 'package:app/presentation/pages/home/widgets/home_app_bar.dart';
import 'package:app/presentation/pages/home/widgets/home_table.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/widgets/bars/custom_drawer.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_text_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scaffoldKey.currentState?.openDrawer(); // Opens drawer after build
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,

      // appBar: AppBar(),
      // drawer: Expanded(child: CustomDrawer()),
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          Expanded(flex: 2, child: SideBar()),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Column(children: [HomeAppBar(), HomeBody()]),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.screenPadding,
        vertical: AppSizes.screenPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomServiceCard(
                    color: AppColors.darkPurple,
                    icon: Icons.money,
                    text: "Income",
                    number: '25450',
                    iconAppear: true,
                  ),
                  Container(
                    height: 100,
                    child: VerticalDivider(
                      color: AppColors.grey,
                      thickness: AppSizes.borderSize,
                    ),
                  ),
                  CustomServiceCard(
                    color: AppColors.darkPurple,
                    icon: Icons.sticky_note_2_rounded,
                    text: "Invoices",
                    number: '512',
                    iconAppear: false,
                  ),
                  Container(
                    height: 100,
                    child: VerticalDivider(
                      color: AppColors.grey,
                      thickness: AppSizes.borderSize,
                    ),
                  ),
                  CustomServiceCard(
                    color: AppColors.darkPurple,
                    icon: Icons.sticky_note_2_rounded,
                    text: "returned products",
                    number: '14',
                    iconAppear: false,
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
                      Text('Rigesters', style: CustomTextStyles.header2),
                    ],
                  ),
                  SizedBox(height: AppSizes.verSpacesBetweenContainers),

                  Row(
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
                          SizedBox(width: AppSizes.horiSpacesBetweenElements),
                          CustomDropDownButton(
                            icon: IconsaxPlusLinear.tag,
                            color: AppColors.white,
                            title: "Device",
                            list: ["Any Device", "Device 1", 'Device 2'],
                            selected: 'اي جهاز',
                            width: 200,
                            height: AppSizes.widgetHeight,
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweenElements),

                          CustomDropDownButton(
                            icon: IconsaxPlusLinear.tag,
                            color: AppColors.white,
                            title: "Status",
                            list: [" Any Status ", "Status 2", 'Status1 '],
                            selected: " Any Status ",
                            width: 200,
                            height: AppSizes.widgetHeight,
                          ),
                        ],
                      ),
                      CustomIconTextButton(
                        text: 'Search',
                        icon: Icons.search,
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
    );
  }
}

class CustomServiceCard extends StatefulWidget {
  final Color? color;
  final IconData icon;
  final String text;
  final String number;
  final bool iconAppear;
  const CustomServiceCard({
    super.key,
    this.color,
    required this.icon,
    required this.text,
    required this.number,
    required this.iconAppear,
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
        margin: EdgeInsets.symmetric(vertical: AppSizes.screenPadding),
        decoration: BoxDecoration(
          // border: Border.all(color: currentColor),
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.textFieldRadius),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12,
          //     offset: Offset(0, 2),
          //     spreadRadius: 1,
          //     blurRadius: 2,
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              ),
              child: Icon(size: 30, widget.icon, color: widget.color),
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.iconAppear
                        ? SizedBox(
                          height: 18,
                          child: Image.asset('lib/assets/icons/rial.png'),
                        )
                        : SizedBox(),
                    widget.iconAppear
                        ? SizedBox(width: AppSizes.horiSpacesBetweentTexts)
                        : SizedBox(),
                    Text(
                      widget.number,
                      style: TextStyle(
                        fontSize: AppSizes.fontSize1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: AppSizes.fontSize2,
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

class CustomListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final Widget page;
  final bool to;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.page,
    required this.to,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.to ? Get.to(widget.page) : Get.off(widget.page);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          color: isHovered ? AppColors.lightGrey : AppColors.lightPurple,
          child: ListTile(
            leading: Icon(widget.icon),
            title: Text(widget.text, style: CustomTextStyles.header2),
          ),
        ),
      ),
    );
  }
}
