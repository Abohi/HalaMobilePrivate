import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderIndexSwitcherStateProvider = StateProvider<int>((ref){
  return  -1;
});