import 'package:doc_doc/feature/presentation/appointment/pages/appointment_screen.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/model.dart';
import 'appointment_provider.dart';

class SummaryScreen extends StatefulWidget {


  SummaryScreen({super.key });

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}
String selectedOption = 'In Person';

class _SummaryScreenState extends State<SummaryScreen> {
  int activeStep=2;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: Text(
          "Book Appointment",
          style: AppStyles.semiBold20Black,
        ),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5.h,
            vertical: 5.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.secondGreyColor,
              width: 1.w,
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.blackColor,
              size: 18.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 17.w,

        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStepper(),
              SizedBox(height: 32.h),
              Text(
                "Booking Information",
                style: AppStyles.bold20Black,
              ),
              SizedBox(height: 22.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                    child: Icon(Icons.date_range, color: AppColors.primaryColor, size: 30.sp),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date & Time",style: AppStyles.semiBold16Black,),
                      SizedBox(height: 2.h,),
                      Text(provider.selectedDate.toString(),style: AppStyles.regular10grey,),
                      SizedBox(height: 2.h,),
                      Text(provider.selectedTime.toString(),style: AppStyles.regular10grey,),
                    ],
                  )
                ],
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                    child: Icon(Icons.event_note_sharp, color: AppColors.greenColor, size: 30.sp),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Appointment Type ",style: AppStyles.semiBold16Black,),
                      SizedBox(height: 2.h,),
                      Text("In Person ",style: AppStyles.regular10grey,),

                    ],
                  )
                ],
              ),

              SizedBox(height: 24.h),
              Text("Doctor Information", style: AppStyles.bold20Black),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image:  const DecorationImage(
                        image: AssetImage(
                          AssetsManager.doctorAnime,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "Dr. Randy Wigham", style: AppStyles.bold17Black),
                      SizedBox(height: 4.h),
                      Text( " General | RSUD Gatot Subroto", style: AppStyles.regular16grey),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          SizedBox(width: 4.w),
                          Text("4.5", style: AppStyles.regular16grey),
                          SizedBox(width: 8.w),
                          Text("10k+ Reviews", style: AppStyles.regular14grey),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text("Payment Information ",style:AppStyles.bold17Black,),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    width:50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image:  const DecorationImage(
                        image: AssetImage(
                          AssetsManager.masterCard,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "MasterCard", style: AppStyles.bold17Black),
                      SizedBox(height: 4.h),
                      Text( " 12***********", style: AppStyles.regular16grey),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              PaymentPopup()

            ],
          ),
        ),
      ),
    );
  }

  EasyStepper buildStepper() {

    return EasyStepper(
      activeStepBackgroundColor: AppColors.primaryColor,
      activeStep: activeStep,
      unreachedStepBackgroundColor: AppColors.searchColor,
      stepShape: StepShape.circle,
      finishedStepBackgroundColor: AppColors.greenColor,
      stepRadius: 22.r,
      showLoadingAnimation: false,
      lineStyle: LineStyle(
        lineType: LineType.normal,
        defaultLineColor: AppColors.greyColor,
        finishedLineColor: AppColors.greenColor,
      ),
      internalPadding: 50.w,
      steps: [
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: Text("1", style: AppStyles.semiBold18White),
            ),
          ),
          customTitle: Text(
            'Date & Time',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 0
                  ? AppColors.greenColor
                  : AppColors.blackColor,
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 1 ? 1 : 0.3,
              child: Text('2', style: AppStyles.semiBold18White),
            ),
          ),
          customTitle: Text(
            'Payment',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 1
                  ? AppColors.greenColor
                  : AppColors.blackColor,
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 2 ? 1 : 0.3,
              child: Text('3', style: AppStyles.semiBold18White),
            ),
          ),
          customTitle: Text(
            'Summary',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 2
                  ? AppColors.greenColor
                  : AppColors.blackColor,
            ),
          ),
        ),
      ],
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
  Widget buildOption({
    required String label,
    required IconData icon,
    required Color iconColor,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(label),
      trailing: Radio<String>(
        value: label,
        groupValue: selectedOption,
        onChanged: (value) {
          setState(() {
            selectedOption = value!;
          });
        },
        activeColor: Colors.blue,
      ),
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
    );
  }
}
class PaymentPopup extends StatelessWidget {
  PaymentPopup({super.key});

  final double subtotal = 4694.0;
  final double tax = 250.0;
  double get total => subtotal + tax;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:  EdgeInsets.all(24.h),
      decoration:  BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),

        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2), // Shadow position
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Info',
            style: AppStyles.bold17Black,
          ),
          SizedBox(height: 30.h),
          _buildInfoRow('SubTotal', '\$${subtotal.toStringAsFixed(2)}'),
          SizedBox(height: 4.h),
          _buildInfoRow('Tax', '\$${tax.toStringAsFixed(2)}'),
          SizedBox(height: 24),
          _buildInfoRow(
            'Payment Total',
            '\$${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
          const SizedBox(height: 30),
          CustomElevatedButton(onPressed: (){
          }, backgroundColor: AppColors.primaryColor,
            text: "Book Now ",
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal? AppStyles.bold17Black : AppStyles.regular14grey,
          ),
          Text(
              value,
              style:
              AppStyles.bol14Black

          ),
        ],
      ),
    );
  }

}