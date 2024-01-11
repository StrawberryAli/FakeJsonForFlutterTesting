import 'package:api_testing/funcoes/requerimento_de_api.dart';
import 'package:api_testing/modelos/post.dart';
const postUrl = 'https://my-json-server.typicode.com/StrawberryAli/FakeJsonForFlutterTesting/posts';
Future<Post> fetchPost(Map<String, dynamic> request) async{
  final url = '$postUrl/${request['id']}';
  final response = await fetchContent(url);
  return Post.fromJson(response);
}

Future<Post> createPost(Map<String, dynamic> request) async{
  final url = postUrl;
  final response = await createContent(url, request);
  return Post.fromJson(response);
}

Future<Post> updatePost(Map<String, dynamic> request) async{
  final url = '$postUrl/${request['id']}';
  final response = await updateContent(url, request);
  return Post.fromJson(response);
  
}
Future<Post?> deletePost(Map<String, dynamic> request) async{
  final url = '$postUrl/${request['id']}';
  await deleteContent(url);
  return null;
}
