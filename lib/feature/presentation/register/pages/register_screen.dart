import 'package:doc_doc/core/api/api_manager.dart';
import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/core/utils/app_routes.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/core/utils/validators.dart';
import 'package:doc_doc/feature/data/data_source/remote_data_source/auth/pages/auth_remote_data_source_impl.dart';
import 'package:doc_doc/feature/data/repository/auth/pages/auth_repository_impl.dart';
import 'package:doc_doc/feature/domain/use_case/register_use_case.dart';
import 'package:doc_doc/feature/presentation/register/cubit/register_states.dart';
import 'package:doc_doc/feature/presentation/register/cubit/register_view_model.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_icon.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quickalert/quickalert.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterViewModel viewModel = RegisterViewModel(
    registerUseCase: RegisterUseCase(
      authRepository: AuthRepositoryImpl(
        authRemoteDataSource: AuthRemoteDataSourceImpl(
          apiManager: ApiManager(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<RegisterViewModel, RegisterStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            QuickAlert.show(context: context, type: QuickAlertType.success);
            Navigator.pushNamed(context, AppRoutes.homeRoute);
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<RegisterViewModel, RegisterStates>(
          bloc: viewModel,
          builder: (context, state) {
            return Stack(
              children: [
                Scaffold(
                  body: SingleChildScrollView(
                    child: Form(
                      key: viewModel.formKey,
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
                                Text("Create Account", style: AppStyles.bold32primary),
                                SizedBox(height: 8.h),
                                Text(
                                  "Sign up now and start exploring all that our\n"
                                      "app has to offer. We're excited to welcome\n"
                                      "you to our community!",
                                  style: AppStyles.regular16grey,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h),
                          CustomTextFormField(
                            validator: (val) => AppValidators.validateEmail(val),
                            controller: viewModel.emailController,
                            hintText: "Email",
                            filledColor: AppColors.whiteColor,
                            hintStyle: AppStyles.regular14grey,
                          ),
                          SizedBox(height: 16.h),
                          CustomTextFormField(
                            validator: (val) => AppValidators.validatePassword(val),
                            controller: viewModel.passwordController,
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
                              validator: (val) => AppValidators.validatePhoneNumber(val.toString()),
                              controller: viewModel.phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                                fillColor: AppColors.secondWhiteColor,
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
                              viewModel.register();
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
                              Text("Or sign in with", style: AppStyles.regular14grey),
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
                              CustomIcon(image: Image.asset(AssetsManager.googleIcon)),
                              SizedBox(width: 32.h),
                              CustomIcon(image: Image.asset(AssetsManager.facebookIcon)),
                              SizedBox(width: 32.h),
                              CustomIcon(image: Image.asset(AssetsManager.appleIcon)),
                            ],
                          ),
                          SizedBox(height: 32.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an Account yet? ", style: AppStyles.semiBold16Black),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                                },
                                child: Text("SignIn", style: AppStyles.semiBold16Primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state is RegisterLoadingState)
                  Container(
                    color:AppColors.transparentColor,
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.primaryColor),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
