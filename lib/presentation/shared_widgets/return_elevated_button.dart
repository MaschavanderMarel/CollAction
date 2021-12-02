import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../themes/constants.dart';

ElevatedButton returnElevatedButton(BuildContext context) => ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => kAlmostTransparent,
        ),
        elevation: MaterialStateProperty.all<double>(4.0),
        shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(const Size(40, 40)),
      ),
      onPressed: () => context.router.pop(),
      child: Image.asset('assets/images/icons/back_icon.png'),
    );
