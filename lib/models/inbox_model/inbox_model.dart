
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
class InboxModel{
  String? messageRecepientId,message,receiverID,buyerId,sellerId,messageId;
  DateTime?createdAt;
  int? messageCount,userMessageCount;
   InboxModel({required this.createdAt,required,this.messageRecepientId,required this.message,
required this.receiverID,required this.buyerId,required this.sellerId,required this.messageId,
required this.messageCount, required this.userMessageCount});
      static InboxModel fromJson(Map<String, dynamic> json,String messageId,int userMessageCount) => InboxModel(
      messageRecepientId: json['messageRecepientId'],
      message: json['message'],
      createdAt: (json['createdAt']as Timestamp).toDate(),
      receiverID: json["receiverID"],
      buyerId: json["buyerId"],
      sellerId: json["sellerId"],
      messageId: messageId,
      messageCount: json["messageCount"],
userMessageCount: userMessageCount
      );
}
