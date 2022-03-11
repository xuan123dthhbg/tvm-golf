import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:golf/app/components/button/custom.button.dart';
import 'package:golf/resources/default.i18n.dart';
import 'package:sizer/sizer.dart';

import '../../themes/styles.dart';
import '../app.module.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, color: AppColor.borderColor),
              errorStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, color: Colors.red),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.borderColor, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.themeColor, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: AppColor.borderColor.withOpacity(0.1),
            ),
          ),
          child: FormBuilder(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Center(child: Image.asset('assets/images/logo.png', height: 35.h)),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      formElement(
                        hintText: "First name".i18n,
                        title: 'First name'.i18n,
                        name: 'firstName',
                        isRequired: true,
                        validator: FormBuilderValidators.required(context, errorText: "This field cannot be empty.".i18n),
                        width: 45.w,
                      ),
                      SizedBox(width: 4.w),
                      formElement(
                        hintText: "Last name".i18n,
                        title: 'Last name'.i18n,
                        name: 'lastName',
                        isRequired: true,
                        validator: FormBuilderValidators.required(context, errorText: "This field cannot be empty.".i18n),
                        width: 45.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                formElement(
                  hintText: "Enter your Handicap".i18n,
                  title: 'Handicap',
                  name: 'handicap',
                  isRequired: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: "This field cannot be empty".i18n),
                    FormBuilderValidators.numeric(context, errorText: "Please enter the correct format".i18n)
                  ]),
                ),
                SizedBox(height: 2.h),
                formElement(
                  hintText: "Email",
                  title: 'Email',
                  name: 'email',
                  isRequired: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: "This field cannot be empty".i18n),
                    FormBuilderValidators.email(context, errorText: "Please enter the correct format".i18n)
                  ]),
                ),
                SizedBox(height: 2.h),
                formElement(
                  hintText: "Enter your password".i18n,
                  title: 'Password'.i18n,
                  name: 'password',
                  isRequired: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: "This field cannot be empty".i18n),
                  ]),
                ),
                SizedBox(height: 5.h),
                CustomButton(
                  child: Text("Register".i18n, style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                  height: 5.h,
                  width: 35.w,
                  onPressed: () {},
                  backgroundColor: AppColor.themeColor,
                ),
                RichText(
                  text: TextSpan(
                    text: "Have had an account yet?".i18n,
                    style: TextStyle(color: AppColor.regularText, fontSize: 13.sp),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ${'Login'.i18n}',
                        style: TextStyle(color: AppColor.themeColor, fontSize: 13.sp),
                        recognizer: TapGestureRecognizer()..onTap = () => Modular.to.pushReplacementNamed(AppModule.login),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formElement({
    required String name,
    required String hintText,
    required String title,
    double? width,
    bool isRequired = false,
    FormFieldValidator<String>? validator,
  }) {
    return SizedBox(
      width: width ?? 94.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: TextStyle(fontSize: 13.sp, color: AppColor.regularText, fontWeight: FontWeight.w400),
              children: [
                if (isRequired) TextSpan(text: "*", style: TextStyle(fontSize: 2.22.h, color: Colors.red)),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          FormBuilderTextField(
            name: name,
            validator: validator,
            decoration: InputDecoration(hintText: hintText),
          ),
        ],
      ),
    );
  }
}
