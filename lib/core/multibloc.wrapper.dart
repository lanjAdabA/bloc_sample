import 'package:bloc_example/logic/cubit/user_cubit.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocWrapper extends StatelessWidget {
  const MultiBlocWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      
      providers: [
        BlocProvider(create: (context) => UserCubit(),),
       

      ],
      child: child);
    
  }
}