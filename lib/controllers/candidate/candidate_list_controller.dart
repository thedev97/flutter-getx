import 'dart:convert';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import 'package:http/http.dart' as http;
import '../../core/values/strings.dart';
import '../../data/model/candidate_list.dart';

class CandidateListController extends GetxController {
  Candidate? candidate;
  RxBool loading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchCandidate();
  }

  void fetchCandidate() async {
    try {
      loading(true);
      http.Response response =
          await http.get(Uri.tryParse(candidate_list_url)!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        candidate = Candidate.fromJson(result);
      } else {
        Commons.snackBar(failed, failedSubMsg);
      }
    } catch (e) {
      Commons.snackBar('Exception', e.toString());
    } finally {
      loading(false);
    }
  }
}
