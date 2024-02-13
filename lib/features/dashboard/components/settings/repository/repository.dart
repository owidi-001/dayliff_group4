import 'package:image_picker/image_picker.dart';

class PickerRepository {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> takePhoto() async {
    try {
      final XFile? file = await picker.pickImage(source: ImageSource.camera);
      return file;
    } catch (e) {
      print('Error taking photo: $e');
      return null;
    }
  }

  Future<XFile?> pickPhoto() async {
    try {
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);
      return file;
    } catch (e) {
      print('Error picking photo: $e');
      return null;
    }
  }
}
