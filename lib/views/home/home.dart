import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constant/data.dart';
import 'package:portfolio/utils/extentions.dart';
import 'package:portfolio/widget/header/navbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final isMobile =
        context.responsiveBreakpoints.between("SMALL_MOBILE", MOBILE);

    return Scaffold(
      appBar: const NavBar(),
      endDrawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: context.querySize.width,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
              boxShadow: [
                BoxShadow(
                    spreadRadius: .1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                    color: context.colorScheme.shadow.withOpacity(.3))
              ],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: ResponsiveRowColumn(
            layout: isMobile
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            columnSpacing: 50,
            rowSpacing: 50,
            rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.spaceEvenly,
            columnVerticalDirection: VerticalDirection.up,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                    width: isMobile
                        ? context.querySize.width
                        : context.querySize.width / 2,
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, I'm Danish Mansoori,",
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "I'm a Mobile Application Developer",
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          profileText,
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(
                        cacheHeight: 250,
                        cacheWidth: 250,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                        "assets/images/profile_img.jpg",
                        errorBuilder: (context, error, stackTrace) => Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                              child:
                                  const Icon(Icons.person_rounded, size: 150),
                            )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
