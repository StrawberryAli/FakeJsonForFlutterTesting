class Post{
  final id;
  final title;
  final content;
  Post({
    required this.id,
    required this.title,
    required this.content
  });
  factory Post.fromJson(Map<String,dynamic> json) => Post(
    id: json['id'], 
    title: json['title'], 
    content: json['body']
  );
}