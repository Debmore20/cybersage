import 'package:cybersage/Views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:cybersage/BLoC/bloc_exports.dart';

import 'Utils/colors.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(StudyBuddyApp());
}

class StudyBuddyApp extends StatelessWidget {
  const StudyBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckStatusEvent()),
        ),
        BlocProvider(
          create: (context) => UserchatsBloc(),
        ),
        BlocProvider(
          create: (context) => DeviceInfoCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          breakpoints: [
            const ResponsiveBreakpoint.resize(350, name: MOBILE),
            const ResponsiveBreakpoint.resize(600, name: TABLET),
            const ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ],
        ),
        home: const MainScreen(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: LightModeColors.primary,
          scaffoldBackgroundColor: LightModeColors.background,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: DarkModeColors.primary,
          scaffoldBackgroundColor: DarkModeColors.background,
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomePage(),
    const ChatsPage(),
    const RoomsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index on item tap
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<DeviceInfoCubit>().fetchDeviceInfo();
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        // margin: const EdgeInsets.only(top: 10),
        child: _pages[_currentIndex],
      ), // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            isDarkMode ? DarkModeColors.background : LightModeColors.background,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_2_sharp),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: isDarkMode
            ? DarkModeColors.button
            : LightModeColors.button, // Beige color for selected item
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
