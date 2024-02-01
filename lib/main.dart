import 'package:flutter/services.dart';
import 'package:kolaka/core/helpers/common_helper.dart';
import 'package:kolaka/core/services/api_client.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'core/helpers/deep_link_handler.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:kolaka/index.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

var playerId;
// Definisi fungsi handleLink
void handleLink(Uri link) {
  if (link.pathSegments.isNotEmpty) {
    // Ambil path pertama sebagai tindakan atau halaman yang diinginkan
    String action = link.pathSegments[0];

    // Lakukan sesuatu berdasarkan tindakan atau halaman yang diinginkan
    switch (action) {
      case 'product':
        // Jika deep link membuka halaman produk, lakukan sesuatu
        String productId =
            link.pathSegments.length > 1 ? link.pathSegments[1] : '';
        print("Opening product page with ID: $productId");
        // Implementasikan logika untuk membuka halaman produk dengan ID tertentu
        break;
      case 'profile':
        // Jika deep link membuka halaman profil, lakukan sesuatu
        print("Opening profile page");
        // Implementasikan logika untuk membuka halaman profil
        break;
      // Tambahkan kasus lain sesuai kebutuhan aplikasi Anda
      default:
        print("Unknown action: $action");
      // Implementasikan penanganan untuk tindakan atau halaman yang tidak dikenali
    }
  } else {
    print("Deep link has no path segments");
    // Implementasikan penanganan untuk deep link tanpa path
  }
}

GetStorage userStorage = GetStorage('userStorage');
GetStorage localStorage = GetStorage('localStorage');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await initFirebase();

  // Inisialisasi dan setup deep link handler
  final deepLinkHandler = DeepLinkHandler();
  deepLinkHandler.initUniLinks(handleLink);

  // final appState = FFAppState(); // Initialize FFAppState
  // await appState.initializePersistedState();

  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.initialize('e014b47a-98a6-4c4d-a524-bb2d44cab099');
  OneSignal.Notifications.requestPermission(true);
  // OneSignal.shared.promptUserForPushNotificationPermission();
  // var deviceState = await OneSignal.shared.getDeviceState();
  await GetStorage.init('userStorage');
  await GetStorage.init('localStorage');
  final appState = FFAppState();
  await appState.initializePersistedState();
  // await initServices();
  // OneSignal.shared
  //     .setSubscriptionObserver((OSSubscriptionStateChanges changes) async {
  //   String? onesignalUserId = changes.to.userId;
  //   print('Player ID: $onesignalUserId');
  //   playerId = onesignalUserId;
  //   print("writing player id to storage");
  //   await userStorage.write('player_id', playerId);
  // });
  // OneSignal.shared
  //     .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //   // will be called whenever a notification is opened/button pressed.
  //   print("notif open");
  //   print(result.notification.additionalData);
  // });

  // playerId = deviceState?.userId;
  // // log('player id : $playerId');
  // var storedPlayerId = await userStorage.read('player_id');
  // print(storedPlayerId);
  // if (storedPlayerId == null) {
  //   print("writing player id to storage");
  //   await userStorage.write('player_id', playerId);
  // }

  // playerId = deviceState?.userId;
  OneSignal.User.pushSubscription.addObserver((state) async {
    print(OneSignal.User.pushSubscription.optedIn);
    print(OneSignal.User.pushSubscription.id);
    print(OneSignal.User.pushSubscription.token);
    print(state.current.jsonRepresentation());
    String? onesignalUserId = state.current.id;
    print('Player ID: $onesignalUserId');
    playerId = onesignalUserId;
    print("writing player id to storage");
    if (userStorage.read('player_id') == null) {
      await userStorage.write('player_id', playerId);
    }
  });
  playerId = OneSignal.User.pushSubscription.id;
  print('player id : $playerId');
  var storedPlayerId = await userStorage.read('player_id');
  print('stored player id : $storedPlayerId');
  if (storedPlayerId == null) {
    print("writing player id to storage");
    await userStorage.write('player_id', playerId);
    if (playerId != null && playerId != '') {
      if (userStorage.read('access_token') != null &&
          userStorage.read('access_token') != '') {
        await CommonHelper.storePlayerId(
            playerId, userStorage.read('user_data')['id'].toString());
      }
    }
  }
  // runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

// Future<void> initServices() async {
//   print('starting services ...');
//   await Get.putAsync<ApiClient>(() async => ApiClient().init());
//   print('All services started...');
// }
Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync<ApiClient>(() async => ApiClient().init());
  print('All services started...');
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<BaseAuthUser> userStream;
  BaseAuthUser? initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = mykomodov2FirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Kolaka',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              FFLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            supportedLocales: const [Locale('en', '')],
            theme: ThemeData(brightness: Brightness.light),
            themeMode: _themeMode,
            home: initialUser == null || displaySplashImage
                ? Builder(
                    builder: (context) => Container(
                      color: FlutterFlowTheme.of(context).accent1,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Onboarding.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : currentUser!.loggedIn
                    ? NavBarPage()
                    : OnboardingWidget(),
          );
        });
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home_Page';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home_Page': HomePageWidget(),
      'Transaksi': TransaksiWidget(),
      'chat': ChatWidget(),
      'SettingProfile': SettingProfileWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).accent1,
        unselectedItemColor: Color(0x7B090F13),
        selectedBackgroundColor: Color(0x00000000),
        borderRadius: 8.0,
        itemBorderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        width: double.infinity,
        elevation: 0.0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0
                      ? FlutterFlowTheme.of(context).accent1
                      : Color(0x7B090F13),
                  size: 24.0,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? FlutterFlowTheme.of(context).accent1
                        : Color(0x7B090F13),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt,
                  color: currentIndex == 1
                      ? FlutterFlowTheme.of(context).accent1
                      : Color(0x7B090F13),
                  size: 24.0,
                ),
                Text(
                  'Pesanan',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? FlutterFlowTheme.of(context).accent1
                        : Color(0x7B090F13),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mark_email_unread,
                  color: currentIndex == 2
                      ? FlutterFlowTheme.of(context).accent1
                      : Color(0x7B090F13),
                  size: 24.0,
                ),
                Text(
                  'Inbox',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? FlutterFlowTheme.of(context).accent1
                        : Color(0x7B090F13),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: currentIndex == 3
                      ? FlutterFlowTheme.of(context).accent1
                      : Color(0x7B090F13),
                  size: 24.0,
                ),
                Text(
                  'Profile',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? FlutterFlowTheme.of(context).accent1
                        : Color(0x7B090F13),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
