import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';




class OrderDownloadTask extends HookWidget {
  final bool isSeller;
  final OrderModel orderModel;
  const OrderDownloadTask({required this.orderModel,required this.isSeller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var loading = useState<bool>(false);
    var progress = useState<double>(0);
    return Container(
      width: size.width,
      height: size.height*0.334,
      decoration: BoxDecoration(border: Border.all(color: const Color(0xffC7C7C7)),borderRadius: BorderRadius.circular(17)),
      child: Stack(
          children:[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height*0.24,
                  decoration: BoxDecoration(color: Colors.white),
                  child: orderModel.fileTypeModel?.fileType=="jpg"?ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(17),topRight: Radius.circular(17)),
                      child: Image.network(orderModel.fileTypeModel!.fileRef,width: size.width,height: size.height,fit: BoxFit.fill,)):Container(
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: size.height*0.09,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17),bottomRight: Radius.circular(17)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          stops: [0.1, 0.9],
                          colors: [
                            Colors.white,
                            const Color(0xffC7C7C7)
                          ]
                      )),
                  padding: EdgeInsets.symmetric(horizontal: 33),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isSeller?Text(""):GestureDetector(
                        onTap: ()async{
                          loading.value = true;
                          await context.read(orderRepositoryProvider).downloadFile(reference: orderModel.fileTypeModel!.fileRef,fileName: orderModel.fileTypeModel!.fileName,extension:orderModel.fileTypeModel!.fileType,onDownloadProgress:(downloadProgress){
                            progress.value = downloadProgress;
                          } );
                          loading.value = false;
                        },
                        child:Row(
                          children: [
                            Icon(Icons.download_rounded,color: Colors.white,size: 17,),
                            Text("")//Share Icon should be here
                          ],
                        ),
                      ),
                      Text(orderModel.fileTypeModel!.fileName,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700)),)
                    ],
                  ),),
              ],
            ),
            loading.value?Center(
              child: CircularProgressIndicator(
                backgroundColor: const Color(0xff0000FF),
                value: progress.value,
                valueColor: AlwaysStoppedAnimation(Colors.grey),),
            ):Text(""),
          ]
      ),
    );
  }
}
