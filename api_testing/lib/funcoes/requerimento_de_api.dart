import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchContent(String url) async{
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if(response.statusCode==200){
    return json.decode(response.body);
  }
  else{
    throw Exception('Failed to load content');
  }
}

Future<dynamic> createContent(String url,Map<String, dynamic> request) async{
  final uri = Uri.parse(url);
  final response = await http.post(uri, body: request);
  if (response.statusCode==201){
    return json.decode(response.body);
  }
  else{
    throw Exception('Failed to create content');
  }
}

Future<dynamic> updateContent(String url,Map<String, dynamic> request) async{
  final uri = Uri.parse(url);
  final response = await http.put(uri, body: request);
  if (response.statusCode==200){
    return json.decode(response.body);
  }
  else{
    throw Exception('Failed to update post');
  }
}
Future<dynamic> deleteContent(String url) async{
  final uri = Uri.parse(url);
  final response = await http.delete(uri);
  if (response.statusCode==200){
    return null;
  }
  else{
    throw Exception('Failed to delete post');
  }
}
