import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/collaction_icons.dart';
import '../../themes/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext _context;
  final String title;
  final bool closable;

  const CustomAppBar(
    this._context, {
    Key? key,
    this.title = "",
    this.closable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: !closable
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                type: MaterialType.button,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                elevation: 4,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => context.router.pop(),
                  child: const Icon(
                    CollactionIcons.left,
                    color: kPrimaryColor400,
                  ),
                ),
              ),
            )
          : null,
      actions: [
        if (closable)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => context.router.pop(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.white,
                onPrimary: kPrimaryColor0,
                tapTargetSize: MaterialTapTargetSize.padded,
              ).merge(
                ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return 5;
                      }
                      return 4;
                    },
                  ),
                ),
              ),
              child: const Icon(
                CollactionIcons.cross,
                color: kPrimaryColor300,
              ),
            ),
          ),
      ],
      title: Text(
        title,
        style: const TextStyle(color: kPrimaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(_context).size.width, 55.0);
}
