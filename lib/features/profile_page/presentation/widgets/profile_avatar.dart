import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';
import '../cubit/image_pciker_cubit.dart';
import '../cubit/image_picker_state.dart';
import 'bottom_sheet.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final imagePickerCubit = getIt<ImagePickerCubit>();
  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      height: 130,
      width: 140,
      child: InkWell(
        onTap: () {
          if (accountInSystemCubit.state.logged) {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Wrap(children: const [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: MyBottomSheet())
              ]),
            );
          }
        },
        child: CustomSizedBox(
          height: 120,
          width: 120,
          child: Stack(
            children: [
              BlocBuilder<ImagePickerCubit, ImagePickerState>(
                  bloc: imagePickerCubit,
                  builder: (context, state) {
                    return CircleAvatar(
                        backgroundColor: mediumGrey,
                        backgroundImage: state.image != null
                            ? FileImage(state.image!)
                            : null,
                        radius: 80,
                        child: state.image == null
                            ? const Icon(
                                Icons.person,
                                size: 100,
                                color: Colors.white,
                              )
                            : null);
                  }),
              const Positioned(
                  right: 3,
                  bottom: 3,
                  child: CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.camera_alt_outlined),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
