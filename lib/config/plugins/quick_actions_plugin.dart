import 'package:miscelaneos/config/config.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugins {
  static registerActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.initialize((shortcutType) {
      switch (shortcutType) {
        case 'biometric':
          appRouter.push('/biometrics');
          break;
        case 'compass':
          appRouter.push('/compass');
          break;
        case 'pokemons':
          appRouter.push('/pokemons');
          break;
        case 'charmander':
          appRouter.push('/pokemons/4');
          break;
        default:
      }
      print('$shortcutType');
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'biometric', localizedTitle: 'Biometric', icon: 'biometric'),
      const ShortcutItem(
          type: 'compass', localizedTitle: 'Compass', icon: 'compass'),
      const ShortcutItem(
          type: 'pokemons', localizedTitle: 'Pokemons', icon: 'pokemons'),
      const ShortcutItem(
          type: 'charmander', localizedTitle: 'Charmander', icon: 'charmander')
    ]);
  }
}
