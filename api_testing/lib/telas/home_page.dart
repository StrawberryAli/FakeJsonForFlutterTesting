import 'package:api_testing/funcoes/manejar_posts.dart';
import 'package:api_testing/modelos/post.dart';
import 'package:api_testing/telas/input_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Post?>? post;
  @override
  void initState() {
    post=null;
    super.initState();
  }
  Future<void> clickGetButton() async{
    Map<String,dynamic>? request = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>const InputPage(title: 'Buscar por id',inputFields: ['id']))
    );
    setState(() {
      post=fetchPost(request!);
    });
  }
  void clickDeleteButton() async{
    Map<String,dynamic>? request = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>const InputPage(title: 'Deletar por id',inputFields: ['id']))
    );
    setState(() {
      post= deletePost(request!);
    });
  }
  void clickPostButton() async{
    Map<String,dynamic>? request = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>const InputPage(title: 'Criar conteúdo',inputFields: ['id','title','body']))
    );
    setState(() {
      post=createPost(request!);
    });
  }
  void clickUpdateButton() async{
    Map<String,dynamic>? request = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>const InputPage(title: 'Atualizar conteúdo',inputFields: ['id','title','body']))
    );
    setState(() {
      post=updatePost(request!);
    });
  }
  Widget buildDataWidget(context,snapshot) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child:Text(snapshot.data.title),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child:Text(snapshot.data.content),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http test'),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<Post?>(future: post, builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
              else if(snapshot.connectionState==ConnectionState.none){
                return Container();
              }
              else{
                if(snapshot.hasData){
                  return  buildDataWidget(context,snapshot);
                }
                else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                else{
                  return Container();
                }
              }
            }),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: ()=>clickGetButton(),
                child: const Text('Get'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: ()=>clickPostButton(),
                child: const Text('Post'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: ()=>clickUpdateButton(),
                child: const Text('Update'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: ()=>clickDeleteButton(),
                child: const Text('Delete'),
              ),
            ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}