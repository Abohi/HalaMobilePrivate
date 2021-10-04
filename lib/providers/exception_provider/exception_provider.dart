import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exceptionMessageProvider = StateProvider<CustomException?>((_) => null);