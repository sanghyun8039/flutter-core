import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/user_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUser('1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loaded:
                (user) =>
                    Text(user.userName, style: TextStyle(color: Colors.black)),
            error: (error) => Text(error.toString()),
          );
        },
      ),
    );
  }
}
