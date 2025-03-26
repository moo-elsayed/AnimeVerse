import 'package:anime_universe/features/collection/presentation/widgets/set_api_key_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/back_arrow.dart';

class UpdateApiKeyView extends StatelessWidget {
  const UpdateApiKeyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: BackArrow(),
        backgroundColor: KSecondaryColor,
        surfaceTintColor: KSecondaryColor,
        title: Text(
          'Set api key',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SetApiKeyBody(),
    );
  }
}
