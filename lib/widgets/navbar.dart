import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/responsive.dart';

class ABFNavbar extends StatefulWidget {

  final VoidCallback onHomeTap;
  final VoidCallback onManifestoTap;
  final VoidCallback onJoinTap;

  const ABFNavbar({
    super.key,
    required this.onHomeTap,
    required this.onManifestoTap,
    required this.onJoinTap,
  });

  @override
  State<ABFNavbar> createState() =>
      _ABFNavbarState();
}

class _ABFNavbarState
    extends State<ABFNavbar> {

  bool menuOpen = false;

  @override
  Widget build(BuildContext context) {

    final isMobile =
        Responsive.isMobile(context);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,

      child: SafeArea(
        child: Column(
          children: [

            // =========================
            // TOP BAR
            // =========================

            Container(
              margin:
                  const EdgeInsets.all(16),

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),

              decoration: BoxDecoration(
                color:
                    AppColors.background
                        .withOpacity(0.92),

                borderRadius:
                    BorderRadius.circular(22),

                border: Border.all(
                  color:
                      AppColors.borderColor,
                ),
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  // =========================
                  // LOGO + TITLE
                  // =========================

                  InkWell(
                    onTap:
                        widget.onHomeTap,

                    child: Row(
                      children: [

                        Image.asset(
                          'assets/images/abf_logo.png',
                          width:
                              isMobile
                                  ? 42
                                  : 58,
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        Text(
                          'ALL BADDIES FRONT',

                          style:
                              AppTextStyles
                                  .navText
                                  .copyWith(
                            fontSize:
                                isMobile
                                    ? 15
                                    : 22,

                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // =========================
                  // DESKTOP NAV
                  // =========================

                  if (!isMobile)

                    Row(
                      children: [

                        _navButton(
                          'HOME',
                          widget.onHomeTap,
                        ),

                        _navButton(
                          'MANIFESTO',
                          widget
                              .onManifestoTap,
                        ),

                        _navButton(
                          'JOIN US',
                          widget.onJoinTap,
                        ),
                      ],
                    ),

                  // =========================
                  // MOBILE MENU ICON
                  // =========================

                  if (isMobile)

                    InkWell(
                      onTap: () {

                        setState(() {

                          menuOpen =
                              !menuOpen;
                        });
                      },

                      child: Icon(
                        menuOpen
                            ? Icons.close
                            : Icons.menu,

                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                ],
              ),
            ),

            // =========================
            // MOBILE DROPDOWN
            // =========================

            if (isMobile && menuOpen)

              Container(
                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                padding:
                    const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color:
                      AppColors.cardBackground
                          .withOpacity(0.96),

                  borderRadius:
                      BorderRadius.circular(
                    22,
                  ),

                  border: Border.all(
                    color:
                        AppColors.borderColor,
                  ),
                ),

                child: Column(
                  children: [

                    _mobileNavButton(
                      'HOME',

                      () {

                        widget.onHomeTap();

                        setState(() {
                          menuOpen =
                              false;
                        });
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    _mobileNavButton(
                      'MANIFESTO',

                      () {

                        widget
                            .onManifestoTap();

                        setState(() {
                          menuOpen =
                              false;
                        });
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    _mobileNavButton(
                      'JOIN US',

                      () {

                        widget.onJoinTap();

                        setState(() {
                          menuOpen =
                              false;
                        });
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // =========================
  // DESKTOP NAV BUTTON
  // =========================

  Widget _navButton(
    String title,
    VoidCallback onTap,
  ) {

    return Padding(
      padding:
          const EdgeInsets.only(
        left: 28,
      ),

      child: InkWell(
        onTap: onTap,

        child: Text(
          title,

          style:
              AppTextStyles.navText,
        ),
      ),
    );
  }

  // =========================
  // MOBILE NAV BUTTON
  // =========================

  Widget _mobileNavButton(
    String title,
    VoidCallback onTap,
  ) {

    return InkWell(
      onTap: onTap,

      child: Container(
        width: double.infinity,

        padding:
            const EdgeInsets.symmetric(
          vertical: 18,
        ),

        decoration: BoxDecoration(
          border: Border.all(
            color:
                AppColors.borderColor,
          ),

          borderRadius:
              BorderRadius.circular(
            16,
          ),
        ),

        child: Center(
          child: Text(
            title,

            style:
                AppTextStyles.navText,
          ),
        ),
      ),
    );
  }
}