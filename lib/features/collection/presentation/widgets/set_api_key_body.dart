import 'package:anime_universe/core/widgets/button.dart';
import 'package:anime_universe/features/collection/presentation/widgets/custom_textFormField.dart';
import 'package:anime_universe/features/home/presentation/manager/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/shared_preferences_manager.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utlis/functions.dart';

class SetApiKeyBody extends StatefulWidget {
  const SetApiKeyBody({super.key});

  @override
  State<SetApiKeyBody> createState() => _SetApiKeyBodyState();
}

class _SetApiKeyBodyState extends State<SetApiKeyBody> {
  TextEditingController updateKeyController = TextEditingController();

  @override
  void dispose() {
    updateKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: updateKeyController,
              hintText: 'Enter API Key',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Button(
                onPressed: () async {
                  if (updateKeyController.text.length == 43) {
                    await SharedPreferencesManager.setApiKey(
                        updateKeyController.text);
                    showCustomSnackBar(
                      context: context,
                      title: 'Success!',
                      message: 'API Key has been updated successfully.',
                      contentType: ContentType.success,
                    );
                    SharedPreferencesManager.setFirstTime(false);
                    context.read<AnimeCubit>().getAllAnime();
                  } else {
                    showCustomSnackBar(
                      context: context,
                      title: 'Error!',
                      message:
                          'Invalid API Key. Please enter a valid 43-character key.',
                      contentType: ContentType.failure,
                    );
                  }
                },
                title: 'Set',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
