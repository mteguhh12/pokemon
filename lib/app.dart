import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pokemon/page/authentication/authentication.dart';
import 'package:pokemon/page/home/home_page.dart';
import 'package:pokemon/page/splash/splash_page.dart';
import 'package:pokemon/utils/const.dart';
import 'package:pokemon/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthenticationCubit _authenticationCubit;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _authenticationCubit = GetIt.I<AuthenticationCubit>();
    Future.delayed(Duration(seconds: 4), () {
      _authenticationCubit.openApp();
    });
    Utils.onWidgetDidBuild(() {
      _authenticationCubit.refreshSplash();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (context, child) => RefreshConfiguration(
        headerBuilder: () => WaterDropMaterialHeader(),
        footerBuilder: () => ClassicFooter(
          loadStyle: LoadStyle.HideAlways,
        ),
        child: OverlaySupport(
          child: MaterialApp(
            title: "Pokemon",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
              ).copyWith(),
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              dialogBackgroundColor: Colors.white,
            ),
            builder: (context, widget) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: widget!);
            },
            home: BlocProvider<AuthenticationCubit>(
              child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  print(state);
                  if (state is AuthenticationUninitialized)
                    return SplashPage();
                  else
                    return HomePage();
                },
              ),
              create: (context) => _authenticationCubit,
            ),
          ),
        ),
      ),
    );
  }
}
