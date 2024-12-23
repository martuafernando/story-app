import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/src/story_feature/provider/story_repository.dart';

class AddStoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;

  AddStoryProvider({required this.storyRepository});

  bool isUploading = false;
  String message = "";
  bool? successUpload;
  String? imagePath;
  XFile? imageFile;

  Future<void> upload(
    List<int> bytes,
    String fileName,
    String description,
    LatLng? location,
  ) async {
    try {
      message = "";
      successUpload = null;
      isUploading = true;
      notifyListeners();

      final response =
          await storyRepository.addStory(bytes, fileName, description, location);
      successUpload = !response.error;
      message = response.message;
      isUploading = false;
      notifyListeners();
    } catch (e) {
      isUploading = false;
      message = e.toString();
      notifyListeners();
    }
  }

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}
