import 'package:go_router/go_router.dart';
import 'package:nike_app_vendors/app/views/screens/Add_Product_Screen/add_Product_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/Splash_Screen/splash_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/auth/login_screen/login_screen.dart';
import 'package:nike_app_vendors/app/views/screens/auth/register_screen/register_screen.dart';
import 'package:nike_app_vendors/app/views/screens/edit_perconal_Info_Screen/edit_profile_screen.dart';
import 'package:nike_app_vendors/app/views/screens/home_screen/home_screen.dart';
import 'package:nike_app_vendors/app/views/screens/my_Profile_Screen/my_profile_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/perconal_Info_Screen/PerconalInfoScreen.dart';
import 'package:nike_app_vendors/app/views/screens/reviews/reviews_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/settings/Setting_Screen.dart';
import 'package:nike_app_vendors/app/views/widgets/BottomNavBar.dart';
import '../data/models/Vendors_Model.dart';
import '../views/screens/auth/forget_password_screen/forget_password_Screen.dart';

abstract class Approuter {
  static const initial = "/";
  static const loginescreen = "/loginescreen";
  static const bottomnav = "/bottomnav";
  static const registerscreen = "/registerscreen";
  static const forgetpasswordscreen = "/forgetpasswordscreen";
  static const homescreen = "/homescreen";
  static const perconalinfoscreen = "/perconalinfoscreen";
  static const myprofilescreen = "/myprofilescreen";
  static const editprofilescreen = "/editprofilescreen";
  static const addproductscreen = "/addproductscreen";
  static const reviewscreen = "/reviewscreen";
  static const settingscreen = "/settingscreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initial,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: loginescreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: forgetpasswordscreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: bottomnav,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: homescreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: myprofilescreen,
        builder: (context, state) => const MyProfileScreen(),
      ),
      GoRoute(
        path: perconalinfoscreen,
        builder: (context, state) => const PerconalInfoScreen(),
      ),
      GoRoute(
        path: editprofilescreen,
        builder: (context, state) => EditProfileScreen(
          vendorModel: state.extra as VendorModel,
        ),
      ),
      GoRoute(
        path: addproductscreen,
        builder: (context, state) => const AddProductScreen(),
      ),
      GoRoute(
        path: reviewscreen,
        builder: (context, state) => const ReviewsScreen(),
      ),
      GoRoute(
        path: settingscreen,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
