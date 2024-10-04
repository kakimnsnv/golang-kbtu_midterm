import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:to_do_go/features/api/models/api_client.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class AiTaskScreenController extends GetxController {
  static AiTaskScreenController get find => Get.find();
  final ApiClient apiClient = GetIt.I.get();

  stt.SpeechToText speechToText = stt.SpeechToText();
  String localeId = 'ru_RU';

  RxBool isListening = false.obs;
  RxBool isSending = false.obs;

  RxString text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    listen();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        isListening.value = true;
        speechToText.listen(
          onResult: (val) {
            text.value = val.recognizedWords;
          },
          localeId: localeId,
        );
      }
    } else {
      isListening.value = false;
      speechToText.stop();
    }
  }

  void restart() async {
    listen();
    listen();
  }

  void sendToBack() async {
    isSending.value = true;
    final List<Task> tasks;
    try {
      tasks = await apiClient.fetchAiTasks(text.value);
      if (tasks.isNotEmpty) {
        Get.offNamed('/add-task-ai/list', arguments: tasks);
        return;
      }
    } catch (e) {
      Get.snackbar(S.current.error, "Error getting tasks from back");
      Get.back();
    }
  }
}
