import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:golf/app/app.module.dart';
import 'package:golf/resources/default.i18n.dart';
import 'package:golf/themes/styles.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            child: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 8.h),
              child: Column(
                children: [
                  Center(child: Image.asset('assets/images/logo.png', height: 35.h)),
                  SizedBox(height: 5.h),
                  FormBuilderTextField(
                    name: "email",
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.email(context, errorText: 'Invalid email'.i18n),
                        FormBuilderValidators.required(context, errorText: 'This field is required'.i18n),
                      ],
                    ),
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 5.h),
                  FormBuilderTextField(
                    name: "password",
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.email(context, errorText: 'Invalid email'.i18n),
                        FormBuilderValidators.required(context, errorText: 'This field is required'.i18n),
                      ],
                    ),
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 5.h),
                  RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(fontSize: 2.h, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Register now!',
                              style: TextStyle(fontSize: 2.h, color: AppColor.themeColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Modular.to.popAndPushNamed(AppModule.register))
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
