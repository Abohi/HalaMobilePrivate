import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/dispute_model/dispute_model.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dispute_pages/widget/dispute_tile.dart';
class DisputePage extends HookWidget {
  const DisputePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          "Dispute",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: const Color(0xff3E3E3E),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xff0000FF),
            size: 24,
          ),
          onPressed: () {
            context.popRoute();
          },
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: StreamBuilder<List<DisputeModel>>(
          stream: context.read(orderRepositoryProvider).streamDispute(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      snapshot.data!.map((e) => DisputeItem(onTap: (){}, disputeModel: e)).toList()
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButtonSignup(
                      buttonBg: const Color(0xff0000FF),
                      buttonTitle: "Create Dispute",
                      buttonFontColor: Colors.white,
                      imageIcon: null,
                      onButtonPressed: () {

                      },
                    ),
                  )
                ],
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No dispute available")
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButtonSignup(
                      buttonBg: const Color(0xff0000FF),
                      buttonTitle: "Create Dispute",
                      buttonFontColor: Colors.white,
                      imageIcon: null,
                      onButtonPressed: () {

                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
