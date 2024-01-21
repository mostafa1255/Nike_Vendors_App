import 'package:go_router/go_router.dart';
import 'package:nike_app_vendors/app/views/screens/Add_Product_Screen/add_Product_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/auth/login_screen/login_screen.dart';
import 'package:nike_app_vendors/app/views/screens/auth/register_screen/register_screen.dart';
import 'package:nike_app_vendors/app/views/screens/home_screen/home_screen.dart';
import 'package:nike_app_vendors/app/views/screens/reviews/reviews_Screen.dart';

abstract class Approuter {
  static const initial = "/";
  static const pageview = "/dotcontrolleronboarding";
  static const loginescreen = "/loginescreen";
  static const registerscreen = "/registerscreen";
  static const forgetpasswordscreen = "/forgetpasswordscreen";
  static const homescreen = "/homescreen";
  static const detailsscreen = "/detailsscreen";
  static const mycartscreen = "/mycartscreen";
  static const profilescreen = "/profilescreen";
  static const editprofilescreen = "/editprofilescreen";
  static const notificationscreen = "/notificationscreen";
  static const favoritescreen = "/favoritescreen";
  static const checkoutscreen = "/checkoutscreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initial,
        builder: (context, state) => ReviewsScreen(),
      ),
      /*  GoRoute(
        path: pageview,
        builder: (context, state) => DotcontrollerOnBoarding(),
      ),
      GoRoute(
        path: loginescreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: forgetpasswordscreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: homescreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: detailsscreen,
        builder: (context, state) => DetailsScreen(),
      ),
      GoRoute(
        path: mycartscreen,
        builder: (context, state) => MyCartScreen(),
      ),
      GoRoute(
        path: profilescreen,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: editprofilescreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: notificationscreen,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: favoritescreen,
        builder: (context, state) => FavoriteScreen(),
      ),
      GoRoute(
        path: checkoutscreen,
        builder: (context, state) => CheckOutScreen(),
      ),
      */
    ],
  );
}
