import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halawork/models/order_model/order_model.dart';

import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/repositories/dashboard_repository.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderControllerProvider = StateNotifierProvider<OrderController, List<OrderModel>?>(
      (ref) => OrderController(ref.read),
);

class OrderController extends StateNotifier<List<OrderModel>?> {
  final Reader _read;
  StreamSubscription<List<OrderModel>>? orderModelSubscription;
  OrderController(this._read) : super(null) {
    orderModelSubscription?.cancel();
    orderModelSubscription = _read(orderRepositoryProvider)
        .orderStream()
        .listen((orderList) =>
    state = orderList);
  }

  List<OrderModel>?fetchByOrderType(String orderType){
    List<OrderModel>? orders;
    if(state!=null){
      orders = state!.where((element) => element.orderStatus==orderType).map((e) => e).toList();
    }else{
      orders = null;
    }
   return orders;
  }

  @override
  void dispose() {
    orderModelSubscription?.cancel();
    super.dispose();
  }

}

