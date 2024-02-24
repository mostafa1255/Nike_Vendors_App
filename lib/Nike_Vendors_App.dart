import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/repos/login_Repo/login_repo_Impl.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import 'app/data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import 'app/data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import 'app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'app/data/repos/register_Repo/register_repo_Imp.dart';
import 'app/router/app_router.dart';

class NikeStoreApp extends StatelessWidget {
  const NikeStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => RegisterCubit(
                  RegisterRepoImpl(),
                )),
        BlocProvider(create: (_) => LoginCubit(LoginRepoImpl())),
        BlocProvider(
            create: (_) => VendorCubit(VendroRepoImpl())..getVendorInfo()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, child) {
          return MaterialApp.router(
            routerConfig: Approuter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
/*double pxToDp(BuildContext context, double pixel) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return pixel / devicePixelRatio;
  } */