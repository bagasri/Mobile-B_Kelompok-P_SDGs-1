import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation/navigation.dart';
import 'sidebar.dart';

enum AuthTypee { sidebarlayout }

class SideBarLayout extends StatelessWidget {
  final AuthTypee authTypee;

  const SideBarLayout({Key key, this.authTypee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
