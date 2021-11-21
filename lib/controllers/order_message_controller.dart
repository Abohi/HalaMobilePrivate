import 'dart:async';

import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/providers/state_providers/buyerSellerIdsStateProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderMessageControllerProvider = StateNotifierProvider<OrderMessageController, List<InboxModel>?>(
      (ref) => OrderMessageController(ref.read,ref.read(buyerSellerIdsStateProvider).state![0],ref.read(buyerSellerIdsStateProvider).state![1]),
);

class OrderMessageController extends StateNotifier<List<InboxModel>?> {
  final Reader _read;
  final String buyerId,sellerId;
  StreamSubscription<List<InboxModel>>? userModelChangesSubscription;

  OrderMessageController(this._read,this.buyerId,this.sellerId) : super(null) {
    userModelChangesSubscription?.cancel();
    userModelChangesSubscription = _read(userRepositoryProvider)
        .getOrderMessages(buyerId, sellerId)
        .listen((messages) => state = messages);
  }

  @override
  void dispose() {
    userModelChangesSubscription?.cancel();
    super.dispose();
  }

}
