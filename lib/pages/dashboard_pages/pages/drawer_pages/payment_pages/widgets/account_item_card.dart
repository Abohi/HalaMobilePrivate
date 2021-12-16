import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
class AccountItems extends StatelessWidget {
  final bool isLastCard;
  final AccountInfoDataModel accountInfoDataModel;
  const AccountItems({required this.isLastCard,required this.accountInfoDataModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLastCard?Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          width: size.width,
          decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              border: Border(
                  bottom: BorderSide(width: 1, color: const Color(0xffACACAC)))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${accountInfoDataModel.bankName} ${accountInfoDataModel.account_number.replaceRange(0, accountInfoDataModel.account_number.length-4, "******")}",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff29283C))),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      width: 28,
                      height: 28,
                      child: Center(
                        child: Icon(
                          Icons.edit,
                          color: const Color(0xff5A5AFC),
                          size: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      width: 28,
                      height: 28,
                      child: Center(
                        child: Icon(
                          Icons.delete,
                          color: const Color(0xff5A5AFC),
                          size: 12,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            context.router.navigate(const AddAccountRoute());
          },
          child: Center(
            child: Container(
              width: size.width * 0.3,
              height: 34,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xff0000FF)),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.add,
                    color: const Color(0xff0000FF),
                    size: 15,
                  ),
                  Text(
                    "ADD",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0000FF))),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ):Container(
      height: 55,
      width: size.width,
      decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          border: Border(
              bottom: BorderSide(width: 1, color: const Color(0xffACACAC)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${accountInfoDataModel.bankName} ${accountInfoDataModel.account_number.replaceRange(0, accountInfoDataModel.account_number.length-4, "******")}",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff29283C))),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  width: 28,
                  height: 28,
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: const Color(0xff5A5AFC),
                      size: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  width: 28,
                  height: 28,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: const Color(0xff5A5AFC),
                      size: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}