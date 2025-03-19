import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mid_exam/theme_bloc.dart';
import 'package:mid_exam/theme_state.dart';
import 'package:mid_exam/theme_event.dart';
import 'package:mid_exam/home_screen.dart';
import 'package:mid_exam/CategoryScreen.dart';
import 'package:mid_exam/ProfileScreen.dart';
import 'package:mid_exam/NavigationBloc.dart';
import 'package:mid_exam/NavigationEvent.dart';
import 'package:mid_exam/NavigationState.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) =>  CategoriesScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'E-Shop',
          theme: state.themeData,
          routerConfig: _router,
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        // Simplified screen selection
        Widget currentScreen;
        
        if (state.currentIndex == 0) {
          currentScreen = HomeScreen();
        } else if (state.currentIndex == 1) {
          currentScreen = CategoriesScreen();
        } else if (state.currentIndex == 2) {
          currentScreen = ProfileScreen();
        } else {
          currentScreen = HomeScreen();
        }


        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            title: Text('E-Shop', style: TextStyle(color: theme.appBarTheme.foregroundColor)),
            actions: [
              IconButton(
                icon: Icon(
                  BlocProvider.of<ThemeBloc>(context).state.isDark 
                      ? Icons.light_mode 
                      : Icons.dark_mode,
                  color: theme.appBarTheme.foregroundColor,
                ),
                onPressed: () {
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: theme.appBarTheme.foregroundColor),
                onPressed: () {
                  // Cart functionality will be implemented later
                },
              ),
            ],
          ),
          body: currentScreen,
          bottomNavigationBar: BottomAppBar(
            color: theme.bottomAppBarTheme.color,
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Home item - using GestureDetector instead of InkWell
                  GestureDetector(
                    onTap: () {
                      context.read<NavigationBloc>().add(NavigateEvent(0));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: state.currentIndex == 0
                          ? BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            )
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.home,
                            color: state.currentIndex == 0 ? Colors.white : theme.iconTheme.color,
                            size: 20,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: state.currentIndex == 0 ? Colors.white : theme.textTheme.bodyMedium?.color,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Categories item
                  GestureDetector(
                    onTap: () {
                      context.read<NavigationBloc>().add(NavigateEvent(1));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: state.currentIndex == 1
                          ? BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            )
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.category,
                            color: state.currentIndex == 1 ? Colors.white : theme.iconTheme.color,
                            size: 20,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: state.currentIndex == 1 ? Colors.white : theme.textTheme.bodyMedium?.color,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Profile item
                  GestureDetector(
                    onTap: () {
                      context.read<NavigationBloc>().add(NavigateEvent(2));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: state.currentIndex == 2
                          ? BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            )
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            color: state.currentIndex == 2 ? Colors.white : theme.iconTheme.color,
                            size: 20,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: state.currentIndex == 2 ? Colors.white : theme.textTheme.bodyMedium?.color,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}