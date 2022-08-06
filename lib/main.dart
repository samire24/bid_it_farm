
import 'package:bid_it_farm/cubits/app_cubit.dart';
import 'package:bid_it_farm/cubits/app_cubit_logic.dart';
import 'package:bid_it_farm/pages/detail_page.dart';
import 'package:bid_it_farm/pages/navpages/main_page.dart';
import 'package:bid_it_farm/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() =>runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  home: BlocProvider<AppCubit>(
      create: (context)=>AppCubit(
        data: DataServices(),
      ),
    child: AppCubitLogic(),
  )

),
);
