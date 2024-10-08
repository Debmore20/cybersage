import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:cybersage/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _afterBuild();
    });
  }

  void _afterBuild() {
    final state = context.read<AuthBloc>().state;
    if (state is AuthAuthenticated) {
      context
          .read<UserchatsBloc>()
          .add(FetchAllUserChats(state.user.id, state.token));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      height: 120,
                      width: double.infinity,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Study Sage...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: isDarkMode
                            ? DarkModeColors.container
                            : LightModeColors.container,
                      ),
                    ),
                  ],
                )).animate().fadeIn().moveY(begin: 30, curve: Curves.easeOut),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recent',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? DarkModeColors.text
                            : LightModeColors.text),
                  ).animate().fadeIn(delay: 300.ms),
                ),
                chatCreateNewBtn(context).animate().fadeIn(delay: 100.ms),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const ChatsListContainer(
                isPrivateChat: false,
              ),
            ),

            const SizedBox(height: 24),
            // Quick Access to Study Tools
            buildQuickAccessTools(context),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
