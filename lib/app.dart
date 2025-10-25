// lib/app.dart
import 'package:flutter/material.dart';
import 'package:flutter5/shared/widgets/router.dart';
import 'state/app_state.dart';
import 'shared/widgets/bottom_nav_bar.dart';

class App extends StatelessWidget {
  final AppState appState;
  final AppRouter router;

  const App({required this.appState, required this.router, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the Router widget entirely since MaterialApp.router already handles routing
      body: Container(), // You can't directly access the router content here
      bottomNavigationBar: AnimatedBuilder(
        animation: appState,
        builder: (context, _) {
          return BottomNavBar(
            currentScreen: appState.currentScreen,
            onTabSelected: (screen) => appState.setScreen(screen),
          );
        },
      ),
    );
  }
}