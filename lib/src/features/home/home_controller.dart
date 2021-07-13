import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/models/models.dart';

enum AppStates { loading, error, success, none }

class HomeController {
  final List<PostModel> posts = [];
  AppStates state = AppStates.none;

  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<void> getAllPosts(void Function() updateUI) async {
    state = AppStates.loading;
    updateUI.call();

    try {
      final response = await http.get(Uri.parse('$_baseUrl/posts'));

      if (response.statusCode == 200) {
        posts.addAll((jsonDecode(response.body) as List).map((dynamic item) => PostModel.fromMap(item)).toList());
        state = AppStates.success;
        updateUI.call();
      } else {
        state = AppStates.error;
        updateUI.call();
      }
    } catch (e) {
      state = AppStates.error;
      updateUI.call();
    }
  }
}
