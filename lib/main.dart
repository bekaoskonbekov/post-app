import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/core/app_theme.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/add_delete_update/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/post/post_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>di.sl<PostBloc>()..add(GetAllPostEvent())),
        BlocProvider(create: (context)=>di.sl<AddDeleteUpdatePostBloc>()),
        
      ],
      child: MaterialApp(
    
        theme: appTheme,
        home: HomePage(),
      ),
    );
  }
}
