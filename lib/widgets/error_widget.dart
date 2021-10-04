import 'package:flutter/material.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:lottie/lottie.dart';

class ErrorWidgetControl extends StatelessWidget {
  ErrorWidgetControl({required this.networkFailure, required this.retryHandler});

  final NetworkFailure? networkFailure;
  final dynamic retryHandler;
  @override
  Widget build(BuildContext context) {

    return networkFailure==null? _ErrorView(
        image:  'assets/anim/12955-no-internet-connection-empty-state.json',
        errorTitle: 'Failed to retrive data' ,
        errorDescription: 'Please try again!',
        retryHandler: retryHandler
    ): networkFailure!.map(
          (value)=> const Center(child: const Text('Network error')),
      fetchDataException: (f) => _ErrorView(
          image:  'assets/anim/12955-no-internet-connection-empty-state.json',
          errorTitle: 'Failed to retrive data' ,
          errorDescription: f.message?? 'Please try again!',
          retryHandler: retryHandler
      ),
      badRequestException: (f) => _ErrorView(
          image:  'assets/anim/39161-network-error.json',
          errorTitle: 'Bad request exception' ,
          errorDescription: f.message?? 'Please try again!',
          retryHandler: retryHandler
      ),
      unauthorisedException: (f) => _ErrorView(
          image:  'assets/anim/39620-404-network.json',
          errorTitle: 'You session has expired.' ,
          errorDescription: f.message?? 'Kindly login!',
          retryHandler: retryHandler
      ),
      invalidInputException: (f) => _ErrorView(
          image:  'assets/anim/12955-no-internet-connection-empty-state.json',
          errorTitle: 'Invalid input error' ,
          errorDescription: f.message?? 'Please try again!',
          retryHandler: retryHandler
      ),
      noNetworkException: (f) => _ErrorView(
          image: 'assets/anim/12955-no-internet-connection-empty-state.json',
          errorTitle: 'No Internet', errorDescription: 'Please check your connectivity',
          retryHandler: retryHandler
      ),
      generalException: (f) => _ErrorView(
          image: 'assets/anim/12955-no-internet-connection-empty-state.json',
          errorTitle: 'Unknown error', errorDescription: 'An unknown error has occurred',
          retryHandler: retryHandler
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  _ErrorView({required this.image, required this.errorTitle,required this.errorDescription, required this.retryHandler});

  final String image;
  final String errorTitle;
  final String errorDescription;
  final dynamic retryHandler;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(errorTitle, style: TextStyle(fontSize: 22),),
            Text(errorDescription),
            LottieBuilder.asset(image, height: 200,),
            TextButton(onPressed: retryHandler, child: const Text('Retry'))
          ],
        ),
      ),
    );
  }
}