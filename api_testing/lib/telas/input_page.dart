import 'package:flutter/material.dart';

class InputPage extends StatefulWidget{
  final String title;
  final List<String> inputFields;
  const InputPage({super.key,required this.title,required this.inputFields});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  List<TextEditingController>? controllers;
  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.inputFields.length, (index) => TextEditingController());
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
        children: [
          Expanded(
            child:ListView.builder(
            itemCount: controllers?.length,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  Text(widget.inputFields[index]),
                  TextField(
                    controller: controllers![index],
                  ),
                ],
              );    
            } 
            ),
          ),
          ElevatedButton(onPressed:()async{
            Map<String,dynamic> requestData={};
            for(int i=0;i<controllers!.length;i++){
              requestData.addAll({widget.inputFields[i]:controllers?[i].text});
            }
            Navigator.pop(context,requestData);
          }, 
          child: const Text('Confirmar')),
        ],
      ),
    )     
    );
  }
}