import 'package:flutter/material.dart';

import '../colors.dart';
import 'size_config.dart';

class AppBarWithLeading extends StatelessWidget implements PreferredSizeWidget {
  final Function? callback;
  final double appBarHeith;
  const AppBarWithLeading({
    Key? key,
    required this.appBarHeith,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () async {
          Navigator.of(context).pop();
          if (callback != null) {
            await Future.delayed(const Duration(milliseconds: 10));

            callback!();
          }
        },
        child: Icon(
          Icons.arrow_back,
          size: SizeConfig(context, 24)(),
          color: Colors.black,
        ),
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: SizeConfig(context, 64)(),
      elevation: 0,
      backgroundColor: whiteBackgroudCOlor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeith);
}
