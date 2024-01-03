import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/provider/themeProvider/theme_provider.dart';
import 'package:portfolio/utils/extentions.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class NavBar extends ConsumerWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile =
        context.responsiveBreakpoints.between("SMALL_MOBILE", MOBILE);
    return isMobile ? const MobileNavbar() : const WebsiteNavbar();
  }
}

class WebsiteNavbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const WebsiteNavbar({Key? key}) : super(key: key);

  @override
  ConsumerState<WebsiteNavbar> createState() => _WebsiteNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WebsiteNavbarState extends ConsumerState<WebsiteNavbar> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeStateProvider);
    const lightMode = ThemeMode.light;
    const darkMode = ThemeMode.dark;

    changeTheme() {
      ref.watch(themeStateProvider.notifier).state =
          themeMode == lightMode ? darkMode : lightMode;
    }

    return AppBar(
      title: const Text("My Portfolio"),
      titleSpacing: 30,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Home", style: Theme.of(context).textTheme.bodyLarge),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {},
          child: Text("Projects", style: Theme.of(context).textTheme.bodyLarge),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {},
          child: Text("About", style: Theme.of(context).textTheme.bodyLarge),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {},
          child: Text("Contact", style: Theme.of(context).textTheme.bodyLarge),
        ),
        const SizedBox(width: 10),
        TextButton.icon(
          onPressed: () {
            changeTheme();
          },
          style: TextButton.styleFrom(
              side: BorderSide(width: 1, color: context.colorScheme.primary)),
          label: Text(themeMode != lightMode ? "Dark Mode" : "Light Mode"),
          icon: Icon(themeMode == lightMode
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class MobileNavbar extends ConsumerStatefulWidget {
  const MobileNavbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileNavbarState();
}

class _MobileNavbarState extends ConsumerState<MobileNavbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Portfolio"),
      automaticallyImplyLeading: false,
      centerTitle: true,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      actions: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.menu)),
        const SizedBox(width: 10),
      ],
    );
  }
}

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeStateProvider);
    const lightMode = ThemeMode.light;
    const darkMode = ThemeMode.dark;

    changeTheme() {
      ref.watch(themeStateProvider.notifier).state =
          themeMode == lightMode ? darkMode : lightMode;
    }

    return NavigationDrawer(
      onDestinationSelected: (value) {
        if (value == 4) {
          changeTheme();
        }
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        // close
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 230, right: 30),
          child: IconButton(
              style: IconButton.styleFrom(fixedSize: const Size(30, 30)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close_rounded)),
        ),

        // home
        const SizedBox(height: 10),
        NavigationDrawerDestination(
          icon: Image.asset(
            "assets/drawer/home.png",
            width: 24,
            height: 24,
            color: context.colorScheme.primary,
          ),
          label: const Text("Home"),
        ),

        // projects
        const SizedBox(height: 10),
        NavigationDrawerDestination(
          icon: Image.asset(
            "assets/drawer/project.png",
            width: 24,
            height: 24,
            color: context.colorScheme.primary,
          ),
          label: const Text("Projects"),
        ),

        // about
        const SizedBox(height: 10),
        NavigationDrawerDestination(
          icon: Image.asset(
            "assets/drawer/about.png",
            width: 24,
            height: 24,
            color: context.colorScheme.primary,
          ),
          label: const Text("About"),
        ),

        // contact
        const SizedBox(height: 10),
        NavigationDrawerDestination(
          icon: Image.asset(
            "assets/drawer/contact.png",
            width: 24,
            height: 24,
            color: context.colorScheme.primary,
          ),
          label: const Text("Contact"),
        ),

        // change theme
        const SizedBox(height: 10),
        NavigationDrawerDestination(
          icon: Icon(themeMode == lightMode
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded),
          label: Text(themeMode != lightMode ? "Dark Mode" : "Light Mode"),
        ),
      ],
    );
  }
}
