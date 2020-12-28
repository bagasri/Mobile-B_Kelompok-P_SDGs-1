import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:findjobs/models/job/job_bloc.dart';
import 'package:findjobs/models/theme/theme_bloc.dart';
import 'package:findjobs/ui/theme/theme.dart';

class findjobs extends StatefulWidget {
  final Widget home;

  const findjobs({
    Key key,
    @required this.home,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<findjobs> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<JobBloc>(
          create: (BuildContext context) => JobBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeData theme = AppTheme.lightTheme;
          if (state is LoadedTheme) {
            theme = state.type == ThemeType.DARK ? AppTheme.darkTheme : AppTheme.lightTheme;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) => "",
            theme: theme,
            home: widget.home,
          );
        },
      ),
    );
  }
}
