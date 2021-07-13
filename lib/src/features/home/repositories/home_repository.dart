import '../../../shared/models/models.dart';
import '../../../shared/services/services.dart';

class HomeRepository {
  Future<List<PostModel>> getPostsRemote() async {
    final response = await HttpClient().get('/posts');

    if (response.statusCode == 200)
      return (response.data as List).map((dynamic item) => PostModel.fromMap(item)).toList();
    else
      throw Exception('Erro ao buscar posts');
  }
}
