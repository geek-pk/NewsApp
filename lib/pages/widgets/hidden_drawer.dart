


import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

hiddenDrawer(var items){
  return  HiddenDrawerMenu(
    backgroundColorMenu: Colors.blueGrey,
    backgroundColorAppBar: Colors.cyan,
    screens: items,
    typeOpen: TypeOpen.FROM_RIGHT,
    // disableAppBarDefault: true,
    //    enableScaleAnimin: true,
    //    enableCornerAnimin: true,
    //    slidePercent: 80.0,
    //    verticalScalePercent: 80.0,
    //    contentCornerRadius: 10.0,
    //    iconMenuAppBar: Icon(Icons.menu),
    //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
    //    whithAutoTittleName: true,
    //    styleAutoTittleName: TextStyle(color: Colors.red),
    //    actionsAppBar: <Widget>[],
    //    backgroundColorContent: Colors.blue,
    //    elevationAppBar: 4.0,
    //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
    //    enableShadowItensMenu: true,
    //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
  );
}

