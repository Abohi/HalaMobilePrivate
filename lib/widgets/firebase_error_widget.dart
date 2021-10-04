import 'package:flutter/material.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
class FirebaseErrorWidget extends StatelessWidget {
  final String message;

  const FirebaseErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 20.0)),
          LottieBuilder.asset( 'assets/anim/39161-network-error.json', height: 200,),
          const SizedBox(height: 20.0),
          TextButton(
            onPressed: () => context
                .read(serviceTypeControllerProvider.notifier)
                .retrieveServiceType(isRefreshing: true),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}