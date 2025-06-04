import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/signup_page.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [AppColors.lightPurple, AppColors.darkPurple],
              ),
            ),
          ),
          Positioned(
            left: AppSizes.horizontalPadding * 2,
            top: AppSizes.horizontalPadding * 2,
            child: Container(
              height: 50,
              child: Image.asset('lib/assets/images/logo.png'),
            ),
          ),
          Positioned(
            right: AppSizes.horizontalPadding * 2,
            top: AppSizes.verticalPadding * 2,
            bottom: AppSizes.verticalPadding * 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding * 3,
                vertical: AppSizes.verticalPadding * 3,
              ),
              width: context.screenWidth / 2,
              height: context.screenHeight,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: AppColors.darkPurple,
                        ),
                      ),
                      Row(
                        children: [
                          Text('Wellcome Back..'),
                          Icon(size: 20, Icons.favorite, color: AppColors.red),
                        ],
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: context.screenWidth,
                        child: CustomTextField(
                          hintText: 'Email',
                          icon: Icons.email,
                          width: width,
                          enabled: true,
                        ),
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),

                      SizedBox(
                        width: context.screenWidth,
                        child: CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          width: width,
                          enabled: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.verticalPadding * 3),
                  CustomButton(
                    text: 'Sign in',
                    radius: true,
                    width: 2,
                    page: HomePage(),
                    height: AppSizes.widgetHeight,
                    color: AppColors.darkPurple,
                    textColor: AppColors.white,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
