import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import 'package:penjualanku/screens/home/navigasi.dart';

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Musik Streaming',
      subTitle:
          'Earphone telah menjadi teman setia bagi pecinta musik dan musik streaming.',
      imageUrl: 'assets/images/slider1.png',
    ),
    Introduction(
      title: 'Podcast',
      subTitle:
          'Diskusi menarik atau cerita menakjubkan kapan pun Anda inginkan.',
      imageUrl: 'assets/images/slider2.png',
    ),
    Introduction(
      title: 'Olahraga',
      subTitle: 'Earphone adalah teman yang sempurna untuk intruksi latihan.',
      imageUrl: 'assets/images/slider3.png',
    ),
    Introduction(
      title: 'Panggilan/Video',
      subTitle:
          'Earphone memainkan peran penting dalam menjaga koneksi dengan rekan kerja dan keluarga.',
      imageUrl: 'assets/images/slider4.png',
    ),
  ];

  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Navigasi(),
            ),
            (route) => false);
      },
    );
  }
}
