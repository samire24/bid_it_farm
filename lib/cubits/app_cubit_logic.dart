import 'package:bid_it_farm/cubits/app_cubit.dart';
import 'package:bid_it_farm/pages/detail_page.dart';
import 'package:bid_it_farm/pages/navpages/main_page.dart';
import 'package:bid_it_farm/pages/wecome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
          builder: (context, state){
            if (state is DetailState){
              return DetailPage();
            }
            if (state is WelcomeState){
              return WelcomePage();
            }
            if (state is LoadedState){
              return MainPage();
            }
            if (state is LoadingState){
              return Center(child: CircularProgressIndicator(),);
            }

            else
              {
                return Container();
              }

          }
      ),
    );
  }
}
