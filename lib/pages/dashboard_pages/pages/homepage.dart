import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/recently_visited_model/recently_visited_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_component/byservice_component.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_component/byservices_component.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/widgets/sellerview_tiles.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/widgets/home_searchfield.dart';
import 'package:halawork/pages/dashboard_pages/widget/complete_sellersprofile_widget.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class HomePage extends HookWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userControllerProvider);
    return Container(
      width: size.width,
      height: size.height,
      child: CustomScrollView(
        slivers: [
          CompleteSellerProfile(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20,),
          ),
          SliverToBoxAdapter(
            child: HomeSearchField(onButtonPressed: (){
              context.router.navigate(HomeSearchMainRoute());
            },),
          ),
          SliverToBoxAdapter(
            child: ByServiceComponentHeader(onButtonPressed: (){
              context.router.navigate(ByServiceRoute());
            },),
          ),
          userModelState!.serviceList==null || userModelState.serviceList!.isEmpty?SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ):const SliverToBoxAdapter(
            child: const ByserviceComponent(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 43, bottom: 20),
              child: Text(
                "Recently Viewed",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff29283C),
                        fontSize: 16)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder<List<RecentlyVisitedModel>>(
              stream: context.read(userRepositoryProvider).getRecentlyVisited(),
              builder:(context,snapshot){
                if(snapshot.hasData){
                  return SizedBox(
                    height: size.height*0.35,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: snapshot.data!.map((e) => SellersViewedTiles(recentlyVisitedModel: e)).toList()
                    ),
                  );

                }
                return  Text("You have not made any search yet");
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          )
        ],
      ),
    );
  }

}
