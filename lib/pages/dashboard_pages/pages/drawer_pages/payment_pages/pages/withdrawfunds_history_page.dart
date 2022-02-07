import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/transfer_model/transfer_response_data_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/widgets/history_date_button.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/widgets/transferHistoryCard.dart';
import 'package:halawork/providers/state_providers/dateStateProvider.dart';
import 'package:halawork/providers/state_providers/transferResponseDataModelFilteredListProvider.dart';
import 'package:halawork/providers/state_providers/transferResponseDataModelListProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class WithDrawfundHistoryPage extends HookWidget {
  const WithDrawfundHistoryPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var dateState = useProvider(dateStateProvider);
    var filteredTransferResponseDataState= useProvider(transferResponseDataModelFilteredListProvider);
    var transferResponseDataState = useProvider(transferResonseDataModelListProvider);
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 5,
          title: Text(
            "Funds History",
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
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 20),
                sliver: SliverAppBar(
                  titleSpacing: 0,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  collapsedHeight: size.height * 0.09,
                  flexibleSpace: HistoryDateButton(),
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  centerTitle: false,
                ),
              ),
              StreamBuilder<List<TransferResponseDataModel>>(
                stream: context.read(userRepositoryProvider).getTransfers(),
                  builder: (context,snapshot){
                if(snapshot.hasData){
                  if(transferResponseDataState.state==null){
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      transferResponseDataState.state = snapshot.data;
                    });
                  }
                  if(snapshot.data!.isEmpty)
                    return SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No Transfer History Record")
                        ],
                      ),
                    );
                  if(snapshot.data!.length==0)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Transfer History Record")
                      ],
                    );
                  return filteredTransferResponseDataState.state==null?SliverList(
                    delegate: SliverChildListDelegate(
                      snapshot.data!.map((e) => TransferHistoryCard(transferResponseDataModel: e)).toList()
                    ),
                  ):FilteredTransactionHistoryItems();
                }else{
                   return SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Transfer History Record")
                      ],
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class FilteredTransactionHistoryItems extends HookWidget {
  const FilteredTransactionHistoryItems();

  @override
  Widget build(BuildContext context) {
    var transferResponseState= useProvider(transferResponseDataModelFilteredListProvider);
    if(transferResponseState.state==null){
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No Transfer History Record")
          ],
        ),
      );
    }else if(transferResponseState.state!.isEmpty){
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No Transfer History Record")
          ],
        ),
      );
    }else if(transferResponseState.state!.length==0){
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No Transfer History Record")
          ],
        ),
      );
    }else{
      return SliverList(
        delegate: SliverChildListDelegate(
            transferResponseState.state!.map((e) => TransferHistoryCard(transferResponseDataModel: e)).toList()
        ),
      );
    }
  }
}
