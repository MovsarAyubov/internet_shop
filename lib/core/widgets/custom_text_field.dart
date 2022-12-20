import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../colors.dart';
import '../components/custom_sized_box.dart';
import '../cubits/form_field_cubit.dart';

class CustomTextField extends StatefulWidget {
  final bool showContent;
  final bool? minLenght;
  final String validationType;
  final TextEditingController controller;
  final String title;
  const CustomTextField({
    Key? key,
    this.showContent = false,
    this.minLenght,
    required this.validationType,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final formFieldCubit = FormFieldCubit();

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      height: 70,
      width: double.infinity,
      child: CustomSizedBox(
        height: 50,
        width: double.infinity,
        child: BlocBuilder<FormFieldCubit, bool>(
            bloc: formFieldCubit,
            builder: (context, state) {
              return TextFormField(
                obscureText: widget.showContent ? formFieldCubit.state : false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.fieldIsEmpty;
                  } else if (!RegExp(widget.validationType).hasMatch(value)) {
                    return AppLocalizations.of(context)!.unauthorizedCharacters;
                  } else if (widget.minLenght ?? false) {
                    if (value.length < 6) {
                      return AppLocalizations.of(context)!.minLengthError;
                    }
                  }
                  return null;
                },
                controller: widget.controller,
                cursorWidth: 1,
                cursorHeight: 25,
                cursorColor: blueBorders,
                decoration: InputDecoration(
                  labelText: widget.title,
                  suffix: widget.showContent
                      ? InkWell(
                          onTap: () {
                            formFieldCubit.showAndHideContent();
                          },
                          child: formFieldCubit.state
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: redText, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: redText, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: blueBorders, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: mediumGrey2, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
