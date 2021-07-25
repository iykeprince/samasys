import 'package:flutter/material.dart';

import 'logo.dart';

AppBar appBar(){
  return AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.dehaze, size: 30, color: Colors.black,),
        ),
        title: LogoBox(),
      );
}