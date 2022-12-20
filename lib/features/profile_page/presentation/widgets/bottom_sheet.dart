import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_shop/features/profile_page/presentation/cubit/image_pciker_cubit.dart';
import 'package:internet_shop/router/app_router.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../setup.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final appRouter = getIt<AppRouter>();
  final imagePickerCubit = getIt<ImagePickerCubit>();

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 110,
      child: BottomSheet(
        onClosing: () {},
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  imagePickerCubit.pickImage(ImageSource.camera);
                },
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: mediumGrey,
                      child: Icon(Icons.camera_alt_rounded),
                    ),
                    RobotoText(
                      AppLocalizations.of(context)!.camera,
                      color: blackText,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  imagePickerCubit.pickImage(ImageSource.gallery);
                },
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: mediumGrey,
                      child: Icon(Icons.image),
                    ),
                    RobotoText(
                      AppLocalizations.of(context)!.gallery,
                      color: blackText,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
