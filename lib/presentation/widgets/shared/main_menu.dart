import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  const MenuItem(
    this.title,
    this.icon,
    this.route,
  );
}

final menuItems = <MenuItem>[
  const MenuItem('Giróscopio', Icons.downloading, '/gyroscope'),
  const MenuItem('Acelerómetro', Icons.speed, '/accelerometer'),
  const MenuItem('Magnetometro', Icons.explore_outlined, '/magnetometer'),
  const MenuItem(
      'Giróscopio Ball', Icons.sports_baseball_outlined, '/gyroscope-ball'),
  const MenuItem('Brújula', Icons.explore, '/compass'),
  const MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  const MenuItem('Biometrics', Icons.fingerprint, '/biometrics'),

  //Location
  const MenuItem('Location', Icons.pin_drop, '/location'),
  const MenuItem('Maps', Icons.map_outlined, '/maps'),
  const MenuItem('Controlled Map', Icons.gamepad_outlined, '/controlled-map'),

  //Badge
  const MenuItem('Badge', Icons.notification_important, '/badge'),

  //Ads
  const MenuItem('Ad Full', Icons.ad_units_rounded, '/ad-fullscreen'),
  const MenuItem('Ad Reward', Icons.fort_sharp, '/ad-rewarded'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => HomeMenuItem(
                title: item.title,
                icon: item.icon,
                route: item.route,
              ))
          .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> bgColors;

  const HomeMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    this.bgColors = const [Colors.lightBlue, Colors.blue],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
