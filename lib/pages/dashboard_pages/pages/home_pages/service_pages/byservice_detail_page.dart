import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/expandable_service_tile.dart';
import 'package:halawork/pages/dashboard_pages/widget/custom_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ByServiceDetailPage extends HookWidget {
  final ActiveServiceModel serviceModel;
  const ByServiceDetailPage({required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final scafKey = useMemoized(() => GlobalKey<ScaffoldState>());
    var userModelState = useProvider(userModelExtensionController);
    return SafeArea(
      child: Scaffold(
        key: scafKey,
        drawer:CustomDrawer(),
        body:CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              pinned: true,
              elevation: 3,
              leading: GestureDetector(
                onTap: () {
                  scafKey.currentState!.openDrawer();
                },
                child:SizedBox(
                  width: 30,
                  height: 30,
                  child: userModelState!.userModel.profilePictureUrl!=null?Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(userModelState.userModel.profilePictureUrl!),
                    ),
                  ):Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text("${userModelState.userModel.email!.toUpperCase().substring(0,1)}",style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          )
                      ),),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xff0000FF),
                        shape: BoxShape.circle
                    ),
                  ),
                ),
              ),
              title: Text(serviceModel.service!, style: GoogleFonts.roboto(textStyle: TextStyle(
                  color: Color(0xFF29283C),
                  fontWeight: FontWeight.w700,
                  fontSize: 20
              ))),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20,),),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal:17.0),
              sliver: SliverToBoxAdapter(child: ExpandableServiceTile(activeServiceModel: serviceModel)),
            )
          ],
        ) ,
      ),
    );
  }
}


// CustomScrollView(
// slivers: [


// ],
// )