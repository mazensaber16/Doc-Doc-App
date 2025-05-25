import 'package:doc_doc/core/api/api_manager.dart';
import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/core/utils/app_routes.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/core/utils/validators.dart';
import 'package:doc_doc/feature/data/data_source/remote_data_source/auth/pages/auth_remote_data_source_impl.dart';
import 'package:doc_doc/feature/data/repository/auth/pages/auth_repository_impl.dart';
import 'package:doc_doc/feature/domain/use_case/login_use_case.dart';
import 'package:doc_doc/feature/presentation/login/cubit/login_states.dart';
import 'package:doc_doc/feature/presentation/login/cubit/login_view_model.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_icon.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = LoginViewModel(
      loginUseCase: LoginUseCase(
        authRepository: AuthRepositoryImpl(
          authRemoteDataSource: AuthRemoteDataSourceImpl(
            apiManager: ApiManager(),
          ),
        ),
      ),
    );

    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            QuickAlert.show(context: context, type: QuickAlertType.success,
            onConfirmBtnTap: (){
              Navigator.pushNamed(context, AppRoutes.homeRoute);
            });

          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is LoginLoadingState) {

          }
        },
        builder: (context, state) {
          final viewModel = context.read<LoginViewModel>();

          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 54.h, left: 32.h),
                        child: Column(
                          children: [
                            Text("Welcome Back", style: AppStyles.bold32primary),
                            SizedBox(height: 8.h),
                            Text(
                              "We're excited to have you back, can't wait to \n see what you've been up to since you last\n logged in.",
                              style: AppStyles.regular16grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      CustomTextFormField(
                        controller: viewModel.mailController,
                        validator: AppValidators.validateEmail,
                        hintText: "Email",
                        filledColor: AppColors.whiteColor,
                        hintStyle: AppStyles.regular14grey,
                      ),
                      CustomTextFormField(
                        controller: viewModel.passwordController,
                        validator: AppValidators.validatePassword,
                        hintText: "Password",
                        filledColor: AppColors.whiteColor,
                        isObscureText: true,
                        isPassword: true,
                        hintStyle: AppStyles.regular14grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<LoginViewModel, LoginState>(
                              builder: (context, state) {
                                 return Row(
                                  children: [
                                    Checkbox(
                                      value: viewModel.isRememberMeChecked,
                                      onChanged: (value) => viewModel.toggleRememberMe(value),
                                      side: BorderSide(width: 2.w, color: AppColors.secondGreyColor),
                                      activeColor: AppColors.primaryColor,
                                    ),
                                    Text("Remember me", style: AppStyles.regular14grey),
                                  ],
                                );
                              },
                            ),
                            Text("Forgot Password ?", style: AppStyles.semiBold17Yellow),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      CustomElevatedButton(
                        onPressed: () => viewModel.login(),
                        backgroundColor: AppColors.primaryColor,
                        text: "Login",
                      ),
                      SizedBox(height: 46.h),
                      Row(
                        children: [
                          Expanded(child: Divider(color: AppColors.secondGreyColor, endIndent: 15.h, indent: 15.h)),
                          Text("Or sign in with", style: AppStyles.regular14grey),
                          Expanded(child: Divider(color: AppColors.secondGreyColor, endIndent: 15.h, indent: 15.h)),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(image: Image.asset(AssetsManager.googleIcon)),
                          SizedBox(width: 32.w),
                          CustomIcon(image: Image.asset(AssetsManager.facebookIcon)),
                          SizedBox(width: 32.w),
                          CustomIcon(image: Image.asset(AssetsManager.appleIcon)),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account yet? ", style: AppStyles.semiBold16Black),
                          InkWell(
                            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.registerRoute),
                            child: Text("SignUp", style: AppStyles.semiBold16Primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

