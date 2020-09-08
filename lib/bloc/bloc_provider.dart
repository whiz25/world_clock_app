import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

abstract class BlocWidget<T, U extends Bloc<T>> extends StatefulWidget {
  const BlocWidget({Key key}) : super(key: key);

  @override
  State createState() => _BlocWidgetState<T, U>();

  Widget build(BuildContext context, T state, U bloc);
  U createBloc();
  Widget buildNoData(BuildContext context, U bloc) => loader();

  Widget loader() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _BlocWidgetState<T, U extends Bloc<T>> extends State<BlocWidget> {
  U bloc;

  @override
  void initState() {
    bloc = widget.createBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext ctxt) {
    return BlocProvider<U>(
      bloc: bloc,
      child: StreamBuilder<T>(
          stream: bloc.output,
          initialData: bloc.state,
          builder: (ctxt, snapshot) => snapshot.hasData && snapshot.data != null
              ? widget.build(ctxt, snapshot.data, bloc)
              : widget.buildNoData(ctxt, bloc)),
    );
  }
}

class BlocPresenter<T, U extends Bloc<T>> extends StatelessWidget {
  final U bloc;
  final Widget Function(BuildContext context, T state, U bloc) builder;
  final Widget Function(BuildContext context) loaderBuilder;
  final String loadingTitle;

  const BlocPresenter(
      {@required this.bloc,
      @required this.builder,
      this.loaderBuilder,
      this.loadingTitle,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: bloc.output,
        initialData: bloc.state,
        builder: (ctxt, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return this.builder(ctxt, snapshot.data, bloc);
          } else if (this.loaderBuilder != null) {
            return this.loaderBuilder(ctxt);
          } else if (this.loadingTitle != null) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(
                  this.loadingTitle,
                )),
                body: Container(
                  child: loader(),
                ));
          }
          return loader();
        });
  }

  Widget loader() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
