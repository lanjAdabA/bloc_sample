import 'package:bloc_example/core/multibloc.wrapper.dart';
import 'package:bloc_example/logic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: const MultiBlocWrapper(child: Root()),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  @override
  void initState() {
   context.read<UserCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   var c = context.watch<UserCubit>();
  var user = c.state.userModel;
  var status = c.state.status;

  switch (status) {
  
    case Status.initial:
      return const CircularProgressIndicator();
    case Status.loading:
          return const CircularProgressIndicator();

    case Status.loaded:
     return Scaffold(
       body: ListView.builder(
        itemCount: user!.length,
        itemBuilder: (context, index) {
         return ListTile(
          title: Text(user[index].name),
         );
       },),
     );
    case Status.error:
           return const Text("Error");

  }


  
   
    // return ListView.builder(
    //   itemCount: 5,
    //   itemBuilder: (context, index) {
    //     return const Text("Names");

    // },);
  }
}
