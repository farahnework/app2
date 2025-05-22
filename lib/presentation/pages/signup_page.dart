import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/signin_page.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [ AppColors.lightPurple, AppColors.darkPurple,],
              ),
            ),
          ),
          Positioned(
            left: AppSizes.screenPadding *2,
            top: AppSizes.screenPadding *2,
            child: Container(
              height: 50,
              child: Image.asset('lib/assets/images/logo.png')),
          ),
           Positioned(
            right: AppSizes.screenPadding * 2,
            top: AppSizes.screenPadding * 2,
            bottom: AppSizes.screenPadding * 2,
            child: Container(
              padding: EdgeInsets.all(AppSizes.screenPadding * 3),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
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
                        'Sign up',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: AppColors.darkPurple,
                        ),
                        
                      ),
                  Row(
                    children: [
                      Text('Wellcome Back..'),
                      Icon(
                        size: 20,
                        Icons.favorite, color: AppColors.red,),
                    ],
                  ),

                    ],
                  ),
                   Column(
                    children: [
                      CustomTextField(hintText: 'First Name', icon: Icons.person, width: width,enabled: true, ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      CustomTextField(hintText: 'Email', icon: Icons.email,width: width,enabled: true, ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      CustomTextField(hintText: 'Company Name', icon: Icons.apartment,width: width/5,enabled: true, ),
                      
                      CustomTextField(hintText: 'Mobile Number', icon: Icons.call,width: width/5,enabled: true,  ),

                      ],),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),

                      CustomTextField(hintText: 'Password', icon: Icons.lock, width: width,enabled: true, ),
                    ],
                  ),
                 
                  CustomButton(text: 'Sign up', radius: true, width: MediaQuery.of(context).size.width, page: HomePage(), height: AppSizes.widgetHeight,),
                  Divider(color: AppColors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "You have account?",
                        style: CustomTextStyles.body,
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      InkWell(
                        onTap: () {
                          Get.off(SigninPage());
                        },
                        child: Text('Sign In', style: CustomTextStyles.tableHeader)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}