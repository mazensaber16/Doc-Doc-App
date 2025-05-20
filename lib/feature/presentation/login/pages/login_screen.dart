import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/core/utils/app_routes.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/core/utils/validators.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_icon.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
bool ?isChecked=false;
TextEditingController mailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key:formKey,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(
                    top: 54.h,
                    left: 32.h
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: AppStyles.bold32primary,
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        "We're excited to have you back, can't wait to \n see what you've been up to since you last\n logged in.",
                        style: AppStyles.regular16grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h,),
                CustomTextFormField(
                  controller: mailController,
                  validator: (val){
                    return AppValidators.validateEmail(val);
                  },
                  hintText: "Email",
                  filledColor: AppColors.whiteColor,
                  hintStyle: AppStyles.regular14grey,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  validator: (val){
                    return AppValidators.validatePassword(val);
                  },
                  hintText: "Password",
                  filledColor: AppColors.whiteColor,
                  isObscureText: true,
                  isPassword: true,
                  hintStyle: AppStyles.regular14grey,

                ),
                Padding(
                  padding:  EdgeInsets.only(right: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: isChecked, onChanged: (newBool){
                            isChecked=newBool;
                            setState(() {

                            });
                          },
                           side: BorderSide(
                             width: 2.w,
                             color: AppColors.secondGreyColor
                           ),
                            activeColor: AppColors.primaryColor,
                          ),
                          Text("Remember me",style: AppStyles.regular14grey,)
                        ],
                      ),

                      Text("Forgot Password ?",style: AppStyles.semiBold17Yellow,)
                    ],
                  ),
                ),
                SizedBox(height: 32.h,),
                CustomElevatedButton(
                    onPressed: (){
                      //Todo: Login (Logic)
                    },
                  backgroundColor: AppColors.primaryColor,
                text: "Login",
                ),
                SizedBox(height: 46.h,),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                          color: AppColors.secondGreyColor,
                          endIndent: 15.h,
                          indent: 15.h,
                          thickness: 0,
                        )
                    ),
                    Text("Or sign in with",style: AppStyles.regular14grey,),
                    Expanded(
                        child: Divider(
                          color: AppColors.secondGreyColor,
                          endIndent: 15.h,
                          indent: 15.h,
                          thickness: 0,
                        )
                    )
                  ],
                ),
                SizedBox(height:32.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 32.h,
                  children: [
                    CustomIcon(
                      image: Image.asset(AssetsManager.googleIcon),
                    ),
                    CustomIcon(
                      image: Image.asset(AssetsManager.facebookIcon),
                    ),
                    CustomIcon(
                      image: Image.asset(AssetsManager.appleIcon),
                    ),
                  ],
                ),
                SizedBox(height:32.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account yet? ",style: AppStyles.semiBold16Black,),
                    InkWell(
                      onTap: (){
                        //Todo: Navigate to Register Screen
                        Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
                      },
                        child: Text(
                      "SignUp",
                      style: AppStyles.semiBold16Primary,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

