import 'package:flutter/cupertino.dart';
import 'package:indexator/app/core/widgets/PageDefault/page_default.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return PageDefault(
      body: Column(
        children: [Text('akhdkajshdkjahsdkjahskda borogodó')],
      ),
    );
  }
}
