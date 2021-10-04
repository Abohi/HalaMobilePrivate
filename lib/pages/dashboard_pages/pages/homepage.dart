import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_component/byservice_component.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_component/byservices_component.dart';
import 'package:halawork/pages/dashboard_pages/widget/complete_sellersprofile_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


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
          const SliverToBoxAdapter(
            child: ByServiceComponentHeader(),
          ),
          userModelState!.serviceList==null || userModelState.serviceList!.isEmpty?SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ):const SliverToBoxAdapter(
            child: const ByserviceComponent(),
          )
        ],
      ),
    );
  }

}
