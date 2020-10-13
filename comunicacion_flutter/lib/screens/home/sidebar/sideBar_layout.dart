import 'package:comunicacion/block_navigation_block/navigation_block.dart';
import 'package:comunicacion/screens/home/principal.dart';
import 'package:comunicacion/screens/home/sidebar/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(Principal()),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationStates) {
                return navigationStates as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
