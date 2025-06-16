import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/perfil_bloc.dart';
import '../bloc/perfil_event.dart';
import '../bloc/perfil_state.dart';
import '../views/perfil_loading_view.dart';
import '../views/perfil_error_view.dart';
import '../views/perfil_view.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PerfilBloc()..add(CargarPerfil()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Perfil'),
          backgroundColor: Color.fromARGB(255, 70, 140, 247),
        ),
        body: BlocBuilder<PerfilBloc, PerfilState>(
          builder: (context, state) {
            if (state is PerfilLoading) {
              return const PerfilLoadingView();
            } else if (state is PerfilError) {
              return PerfilErrorView(
                mensaje: state.mensaje,
                onRetry: () {
                  context.read<PerfilBloc>().add(CargarPerfil());
                },
              );
            } else if (state is PerfilLoaded) {
              return PerfilView(nombreUsuario: state.nombreUsuario);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
