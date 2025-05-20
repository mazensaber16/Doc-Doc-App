import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/core/utils/app_routes.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/core/utils/validators.dart';
import 'package:doc_doc/feature/presentation/login/pages/login_screen.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_icon.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  bool? isChecked = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key:formKey ,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 54.h,
                    left: 31.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: AppStyles.bold32primary,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Sign up now and start exploring all that our\n app has to offer. We're excited to welcome\n you to our community!",
                        style: AppStyles.regular16grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  validator: (val){
                    return AppValidators.validateEmail(val);
                  },
                  controller: mailController,
                  hintText: "Email",
                  filledColor: AppColors.whiteColor,
                  hintStyle: AppStyles.regular14grey,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  validator: (val){
                    return AppValidators.validatePassword(val);
                  },
                  controller: passwordController,
                  hintText: "Password",
                  filledColor: AppColors.whiteColor,
                  isObscureText: true,
                  isPassword: true,
                  hintStyle: AppStyles.regular14grey,
                ),
                SizedBox(height: 17.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: IntlPhoneField(
                    validator: (val){
                       return AppValidators.validatePhoneNumber(val.toString());
                    },
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      fillColor: AppColors.secondWhiteColor
                    ),
                    initialCountryCode: 'EG',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },

                  ),
                ),

                SizedBox(height: 32.h),
                CustomElevatedButton(
                  onPressed: () {
                    //Todo: Register (Logic)
                  },
                  backgroundColor: AppColors.primaryColor,
                  text: "Create Account",
                ),
                SizedBox(height: 46.h),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.secondGreyColor,
                        endIndent: 15.h,
                        indent: 15.h,
                        thickness: 0,
                      ),
                    ),
                    Text(
                      "Or sign in with",
                      style: AppStyles.regular14grey,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.secondGreyColor,
                        endIndent: 15.h,
                        indent: 15.h,
                        thickness: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(
                      image: Image.asset(AssetsManager.googleIcon),
                    ),
                    SizedBox(width: 32.h),
                    CustomIcon(
                      image: Image.asset(AssetsManager.facebookIcon),
                    ),
                    SizedBox(width: 32.h),
                    CustomIcon(
                      image: Image.asset(AssetsManager.appleIcon),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account yet? ",
                      style: AppStyles.semiBold16Black,
                    ),
                    InkWell(
                      onTap: () {
                        //Todo: Navigate to Login Screen
                        Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                      },
                      child: Text(
                        "SignIn",
                        style: AppStyles.semiBold16Primary,
                      ),
                    ),
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
