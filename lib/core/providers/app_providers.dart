import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/cards/data/repository/card_repository.dart';
import '../../features/cards/presentation/viewmodels/cards_viewmodel.dart';
import '../../features/patterns/data/repository/pattern_repository.dart';
import '../../features/patterns/presentation/viewmodels/patterns_viewmodel.dart';

List<SingleChildWidget> appProviders = [
  // Repositories
  Provider<PatternRepository>(
    create: (_) => PatternRepository(),
  ),
  Provider<CardRepository>(
    create: (_) => CardRepository(),
  ),

  // ViewModels
  ChangeNotifierProxyProvider<PatternRepository, PatternsViewModel>(
    create: (context) => PatternsViewModel(
      repository: context.read<PatternRepository>(),
    ),
    update: (context, repository, previous) =>
        previous ?? PatternsViewModel(repository: repository),
  ),
  ChangeNotifierProxyProvider<CardRepository, CardsViewModel>(
    create: (context) => CardsViewModel(
      repository: context.read<CardRepository>(),
    ),
    update: (context, repository, previous) =>
        previous ?? CardsViewModel(repository: repository),
  ),
];
