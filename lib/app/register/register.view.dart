import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        child: FormBuilder(
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Center(child: Image.asset('assets/images/logo.png', height: 35.h)),
              SizedBox(
                height: 4.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 3.w),
                  Container(
                    width: 45.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "First name",
                                  style: TextStyle(fontSize: 2.22.h, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(fontSize: 2.22.h, color: Colors.red),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        FormBuilderTextField(
                          name: "firstName",
                          validator: FormBuilderValidators.required(context, errorText: "This field cannot be empty"),
                          style: TextStyle(fontSize: 2.25.h, color: AppColor.regularText),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5.w, right: 3.w, top: 2.h, bottom: 2.h),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xFFCECECE),
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color(0xFFCECECE),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color(0xFFCECECE),
                                width: 1,
                              ),
                            ),
                            alignLabelWithHint: false,
                            labelStyle: TextStyle(
                              fontSize: 2.25.h,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: "First Name"
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 4.w,),
                  Container(
                    width: 45.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Last name",
                                  style: TextStyle(fontSize: 2.22.h, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(fontSize: 2.22.h, color: Colors.red),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        FormBuilderTextField(
                          name: "lastName",
                          validator: FormBuilderValidators.required(context, errorText: "This field cannot be empty"),
                          style: TextStyle(fontSize: 2.25.h, color: AppColor.regularText),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5.w, right: 3.w, top: 2.h, bottom: 2.h),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color(0xFFCECECE),
                                    width: 1,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xFFCECECE),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xFFCECECE),
                                  width: 1,
                                ),
                              ),
                              alignLabelWithHint: false,
                              labelStyle: TextStyle(
                                fontSize: 2.25.h,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "Last Name"
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 3.w),
                ],
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 94.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Handicap",
                              style: TextStyle(fontSize: 2.22.h, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(fontSize: 2.22.h, color: Colors.red),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FormBuilderTextField(
                      name: "handicap",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context, errorText: "This field cannot be empty"),
                        FormBuilderValidators.numeric(context, errorText: "Please enter the correct format")
                      ]),
                      style: TextStyle(fontSize: 2.25.h, color: AppColor.regularText),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 3.w,
                            top: 2.h,
                            bottom: 2.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        alignLabelWithHint: false,
                        labelStyle: TextStyle(
                          fontSize: 2.25.h,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: "Enter your Handicap",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 94.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Email",
                              style: TextStyle(fontSize: 2.22.h, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(fontSize: 2.22.h, color: Colors.red),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FormBuilderTextField(
                      name: "email",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context, errorText: "This field cannot be empty"),
                        FormBuilderValidators.email(context, errorText: "Please enter the correct format"),
                      ]),
                      style: TextStyle(fontSize: 2.25.h, color: AppColor.regularText),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 3.w,
                            top: 2.h,
                            bottom: 2.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        alignLabelWithHint: false,
                        labelStyle: TextStyle(
                          fontSize: 2.25.h,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: "Enter your email",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 94.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Password",
                              style: TextStyle(fontSize: 2.22.h, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(fontSize: 2.22.h, color: Colors.red),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FormBuilderTextField(
                      name: "password",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context, errorText: "This field cannot be empty"),
                        FormBuilderValidators.email(context, errorText: "Please enter the correct format"),
                      ]),
                      style: TextStyle(fontSize: 2.25.h, color: AppColor.regularText),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 5.w,
                            right: 3.w,
                            top: 2.h,
                            bottom: 2.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xFFCECECE),
                            width: 1,
                          ),
                        ),
                        alignLabelWithHint: false,
                        labelStyle: TextStyle(
                          fontSize: 2.25.h,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: "Enter your password",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              RaisedButton(
                child: Text("Register", style: TextStyle(fontSize: 18),),
                onPressed: (){},
                color: AppColor.themeColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(17, 12, 17, 12),
              ),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                text: TextSpan(
                  text: "Have had an account yet? ",
                  style: TextStyle(color: AppColor.regularText, fontSize: 2.25.h),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(color: AppColor.themeColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Modular.to.popAndPushNamed(AppModule.login)),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
