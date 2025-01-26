import 'package:common_utils/common_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/icon_bloc.dart';
import '../blocs/stock_bloc.dart';
import '../blocs/tab_bloc.dart';
import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../extensions/extensions.dart';
import '../utils/methods.dart';

final css = Css(),
    shades = Shades(),
    measurements = Measurements(),
    // rg = RouteGenerator(flag: true),
    providers = <SingleChildWidget>[
      BlocProvider<TabBloc>(create: getTab),
      BlocProvider<IconBloc>(create: getIcon),
      BlocProvider<StockBloc>(create: getStock)
    ],
    minDesignSize = <double>[
      'minimum_screen_width'.valFromConfig<String>()?.toDouble() ?? double.nan,
      'minimum_screen_height'.valFromConfig<String>()?.toDouble() ?? double.nan
    ].size;

