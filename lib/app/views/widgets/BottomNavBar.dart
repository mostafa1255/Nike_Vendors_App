import 'package:nike_app_vendors/app/core/styles/App_Colors.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/views/screens/Add_Product_Screen/add_Product_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/my_Profile_Screen/my_profile_Screen.dart';
import '../screens/home_screen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavBar> {
  List screens = [
    const HomeScreen(),
    const AddProductScreen(),
    const MyProfileScreen(),
  ];
  int slectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.kPrimaryColor,
        currentIndex: slectedIndex,
        onTap: (index) {
          slectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 27.sp,
            ),
            label: "",
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.add,
                color:
                    slectedIndex == 1 ? AppColors.kPrimaryColor : Colors.white,
                size: 40.sp,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 27.sp),
            label: "",
          )
        ],
      ),
      body: screens[slectedIndex],
    );
  }
}
