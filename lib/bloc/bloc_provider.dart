// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:world_clock_app/bloc/bloc.dart';

// class LoadingBlocBuilder<T extends AutoLoadCubit<U>, U> extends BlocBuilder {
//   final U bloc;
//   final Widget Function(BuildContext context, T state) builder;
//   final Widget Function(BuildContext context) loaderBuilder;
//   final String loadingTitle;

//   const LoadingBlocBuilder(
//       {@required this.bloc,
//       @required this.builder,
//       this.loaderBuilder,
//       this.loadingTitle,
//       Key key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<U, T>(
//         cubit: bloc,
//         builder: (ctxt, state) {
//           if (state != null) {
//             return this.builder(ctxt, state);
//           } else if (this.loaderBuilder != null) {
//             return this.loaderBuilder(ctxt);
//           } else if (this.loadingTitle != null) {
//             return Scaffold(
//                 appBar: AppBar(
//                     title: Text(
//                   this.loadingTitle,
//                 )),
//                 body: Container(
//                   child: loader(),
//                 ));
//           }
//           return loader();
//         });
//   }

//   Widget loader() {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
