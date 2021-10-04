import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class ByserviceComponent extends HookWidget {
  const ByserviceComponent();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userControllerProvider);
    return  ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.32,
        maxWidth: size.width,
      ),
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: userModelState!.serviceList!
              .map((e) => GestureDetector(
            onTap: () {
              context.router.navigate(ByServiceDetailRoute(serviceModel: e));
            },
            child: Container(
              color: const Color(0xffF8F8F8),
              margin: EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: size.width * 0.4,
                    height: size.width * 0.4,
                    child: Center(
                      child: SvgPicture.asset(
                        e.icon!,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xffEBEBFF),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 19.0,
                    ),
                    child: Text(
                      e.service!,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          textStyle: TextStyle(
                              color: const Color(0xff555555), fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ),
          )).toList()),
    );
  }
}
