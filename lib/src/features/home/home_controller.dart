import '../../shared/models/models.dart';
import 'repositories/home_repository.dart';

enum AppStates { loading, error, success, none }

class HomeController {
  late final HomeRepository _repository;

  HomeController() {
    _repository = HomeRepository();
  }

  List<PostModel> posts = [];
  AppStates state = AppStates.none;

  Future<void> getPosts(void Function() updateUI) async {
    state = AppStates.loading;
    updateUI.call();

    try {
      final result = await _repository.getPostsRemote();
      posts.addAll(result);
      state = AppStates.success;
      updateUI.call();
    } catch (e) {
      state = AppStates.error;
      updateUI.call();
    }
  }
}
