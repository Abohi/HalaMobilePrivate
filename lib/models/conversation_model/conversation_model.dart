
import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationModel{
  String? buyerId,sellerId,conversationId,messageRecepientEmail,recieverEmail;
  int? userMessageCount,messageCount;
  DateTime? createdAt;
  ConversationModel({required this.buyerId,required this.sellerId,required this.userMessageCount,this.conversationId,this.messageCount,this.messageRecepientEmail,this.recieverEmail,this.createdAt});
static ConversationModel fromJson(Map<String, dynamic> json,String conversationId,int userMessageCount) => ConversationModel(
buyerId: json["buyerId"],
sellerId: json["sellerId"],
messageCount: json["messageCount"],
userMessageCount: userMessageCount,
    conversationId:conversationId,
  messageRecepientEmail: json["messageRecepientEmail"],
  recieverEmail: json["recieverEmail"],
  createdAt: (json['createdAt']as Timestamp).toDate(),
);
}