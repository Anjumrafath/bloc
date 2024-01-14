import 'package:blocapp/blocs/internetbloc/internet_bloc.dart';
import 'package:blocapp/blocs/internetbloc/internetstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Internet not connected"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return Text("Connected!");
              } else if (state is InternetLostState) {
                return Text("not connected!");
              } else {
                return Text("loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
