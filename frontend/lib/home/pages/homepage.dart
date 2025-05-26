import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../views/home_error_view.dart';
import '../views/home_loading.dart';
import '../views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadProducts()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Productos nuevos")),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const HomeLoadingView();

            } else if (state is HomeLoaded) {
              return HomeView(products: state.products);
              
            } else if (state is HomeError) {
              return HomeErrorView(
                message: state.message,
                onRetry: () {
                  context.read<HomeBloc>().add(LoadProducts());
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
