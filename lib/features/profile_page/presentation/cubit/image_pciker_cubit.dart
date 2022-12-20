import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'image_picker_state.dart';

@LazySingleton()
class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(const ImagePickerState());

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        emit(
          ImagePickerState(
            image: File(image.path),
          ),
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
