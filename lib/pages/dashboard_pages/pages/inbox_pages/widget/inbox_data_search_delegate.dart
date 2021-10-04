import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/conversation_model/conversation_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/inbox_pages/widget/conversation_tile.dart';

class DataSearch extends SearchDelegate<List<ConversationModel>?>{
  List<ConversationModel>?conversationalModels;
  DataSearch({required this.conversationalModels});
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon:Icon(Icons.clear),onPressed: (){
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,),onPressed: (){
      close(context,null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    if(conversationalModels==null)
      return Text("");
    final List<ConversationModel>resultList =conversationalModels!.where((element) => element.recieverEmail!.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context,index)=>ConversationTile(conversationModel: resultList[index],),itemCount: resultList.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(conversationalModels==null)
      return Text("");
    final List<ConversationModel>suggestionList = query.isEmpty?conversationalModels!.map((e) => e).toList():conversationalModels!.map((e) => e).where((element) => element.recieverEmail!.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context,index)=>Padding(
      padding: const EdgeInsets.only(top: 10,left: 17,right:17),
      child: GestureDetector(
        onTap: (){
          showResults(context);
        },
        child: Card(

          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                  text: suggestionList[index].recieverEmail!.substring(0,query.length),
                  style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),
                  children: [
                    TextSpan(text: suggestionList[index].recieverEmail!.substring(query.length),style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),)
                  ]
              ),
            ),
          ),
        ),
      ),
    ),itemCount: suggestionList.length,);
  }

}