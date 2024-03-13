import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/local_language_cubits/local_cubit.dart';
import 'package:nike_app_vendors/app/data/repos/login_Repo/login_repo_Impl.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import 'app/core/styles/App_Colors.dart';
import 'app/data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import 'app/data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import 'app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'app/data/repos/register_Repo/register_repo_Imp.dart';
import 'app/router/app_router.dart';
import 'app/views/widgets/Change_Local_Success.dart';
import 'generated/l10n.dart';

class NikeStoreApp extends StatelessWidget {
  const NikeStoreApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit(RegisterRepoImpl())),
        BlocProvider(create: (_) => LoginCubit(LoginRepoImpl())),
        BlocProvider(create: (_) => VendorCubit(VendroRepoImpl())),
        BlocProvider(create: (_) => LocalCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, child) {
          return BlocBuilder<LocalCubit, LocalState>(
            builder: (context, state) {
              if (state is LocalChange) {
                return Change_Local_Success(
                  locale: state.locale,
                );
              }
              return MaterialApp.router(
                locale: const Locale("en"),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                routerConfig: Approuter.router,
                debugShowCheckedModeBanner: false,
              );
            },
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