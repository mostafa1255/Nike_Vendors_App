// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `nike_app_vendors`
  String get app_name {
    return Intl.message(
      'nike_app_vendors',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Register Account`
  String get register_Account {
    return Intl.message(
      'Register Account',
      name: 'register_Account',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_Out {
    return Intl.message(
      'Log Out',
      name: 'log_Out',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_Number {
    return Intl.message(
      'Phone Number',
      name: 'phone_Number',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload Your Image`
  String get please_Upload_Your_Image {
    return Intl.message(
      'Please Upload Your Image',
      name: 'please_Upload_Your_Image',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get your_Name {
    return Intl.message(
      'Your Name',
      name: 'your_Name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct name`
  String get please_enter_correct_name {
    return Intl.message(
      'Please enter correct name',
      name: 'please_enter_correct_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your correct Email`
  String get please_enter_correct_email {
    return Intl.message(
      'Please enter your correct Email',
      name: 'please_enter_correct_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct Password`
  String get please_enter_correct_Password {
    return Intl.message(
      'Please enter correct Password',
      name: 'please_enter_correct_Password',
      desc: '',
      args: [],
    );
  }

  /// `Password must have uppercase , lower case and 8 character`
  String get password_Condition {
    return Intl.message(
      'Password must have uppercase , lower case and 8 character',
      name: 'password_Condition',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get sign_In_with_Google {
    return Intl.message(
      'Sign In with Google',
      name: 'sign_In_with_Google',
      desc: '',
      args: [],
    );
  }

  /// `please_enter_correct_Phone`
  String get please_enter_correct_phone {
    return Intl.message(
      'please_enter_correct_Phone',
      name: 'please_enter_correct_phone',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get take_Photo {
    return Intl.message(
      'Take Photo',
      name: 'take_Photo',
      desc: '',
      args: [],
    );
  }

  /// `Choose Photo`
  String get choose_Photo {
    return Intl.message(
      'Choose Photo',
      name: 'choose_Photo',
      desc: '',
      args: [],
    );
  }

  /// `Hello Again!`
  String get hello_Again {
    return Intl.message(
      'Hello Again!',
      name: 'hello_Again',
      desc: '',
      args: [],
    );
  }

  /// `Fill your details or continue with Google`
  String get fill_your_details_or_continue_with_Google {
    return Intl.message(
      'Fill your details or continue with Google',
      name: 'fill_your_details_or_continue_with_Google',
      desc: '',
      args: [],
    );
  }

  /// `Recovery Password`
  String get recovery_Password {
    return Intl.message(
      'Recovery Password',
      name: 'recovery_Password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_In {
    return Intl.message(
      'Sign In',
      name: 'sign_In',
      desc: '',
      args: [],
    );
  }

  /// `New User? `
  String get new_User {
    return Intl.message(
      'New User? ',
      name: 'new_User',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_Account {
    return Intl.message(
      'Create Account',
      name: 'create_Account',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_Password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email account to reset your password`
  String get enter_Email_to_Reset_Password {
    return Intl.message(
      'Enter your Email account to reset your password',
      name: 'enter_Email_to_Reset_Password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_Password {
    return Intl.message(
      'Reset Password',
      name: 'reset_Password',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get check_your_email {
    return Intl.message(
      'Check your email',
      name: 'check_your_email',
      desc: '',
      args: [],
    );
  }

  /// `We have send link to your email to reset password`
  String get we_have_send_link_to_your_email_to_reset_password {
    return Intl.message(
      'We have send link to your email to reset password',
      name: 'we_have_send_link_to_your_email_to_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personal_Information {
    return Intl.message(
      'Personal Info',
      name: 'personal_Information',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get add_Product {
    return Intl.message(
      'Add Product',
      name: 'add_Product',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_Out {
    return Intl.message(
      'Sign Out',
      name: 'sign_Out',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `See All Reviews`
  String get see_All_Reviews {
    return Intl.message(
      'See All Reviews',
      name: 'see_All_Reviews',
      desc: '',
      args: [],
    );
  }

  /// `Your Product`
  String get your_Product {
    return Intl.message(
      'Your Product',
      name: 'your_Product',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL Orders`
  String get total_Orders {
    return Intl.message(
      'TOTAL Orders',
      name: 'total_Orders',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL Revenue`
  String get total_Revenue {
    return Intl.message(
      'TOTAL Revenue',
      name: 'total_Revenue',
      desc: '',
      args: [],
    );
  }

  /// `Total {number} Reviews`
  String total_Reviews(Object number) {
    return Intl.message(
      'Total $number Reviews',
      name: 'total_Reviews',
      desc: '',
      args: [number],
    );
  }

  /// `Name of Product`
  String get name_of_Product {
    return Intl.message(
      'Name of Product',
      name: 'name_of_Product',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Descreption`
  String get descreption {
    return Intl.message(
      'Descreption',
      name: 'descreption',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the fields`
  String get fill_the_fields {
    return Intl.message(
      'Please fill all the fields',
      name: 'fill_the_fields',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get my_Profile {
    return Intl.message(
      'My Profile',
      name: 'my_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Available Balance`
  String get available_Balance {
    return Intl.message(
      'Available Balance',
      name: 'available_Balance',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get withdraw {
    return Intl.message(
      'Withdraw',
      name: 'withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No Reviews`
  String get no_Reviews {
    return Intl.message(
      'No Reviews',
      name: 'no_Reviews',
      desc: '',
      args: [],
    );
  }

  /// `User Reviews`
  String get user_Reviews {
    return Intl.message(
      'User Reviews',
      name: 'user_Reviews',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personal_Info {
    return Intl.message(
      'Personal Info',
      name: 'personal_Info',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Save Now`
  String get save_Now {
    return Intl.message(
      'Save Now',
      name: 'save_Now',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Picture`
  String get change_Profile_Picture {
    return Intl.message(
      'Change Profile Picture',
      name: 'change_Profile_Picture',
      desc: '',
      args: [],
    );
  }

  /// `Your New Name`
  String get your_New_Name {
    return Intl.message(
      'Your New Name',
      name: 'your_New_Name',
      desc: '',
      args: [],
    );
  }

  /// `Your New Number`
  String get your_New_Number {
    return Intl.message(
      'Your New Number',
      name: 'your_New_Number',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
