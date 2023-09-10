import 'dart:convert';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import 'package:http/http.dart' as http;
import '../../core/values/strings.dart';
import '../../models/candidate_details.dart';

class CandidateDetailsController extends GetxController {
  CandidateDetails? candidateDetails;
  RxBool loading = false.obs;

  void fetchCandidateDetails(int id) async {
    try {
      loading(true);
      http.Response response =
          await http.get(Uri.tryParse('$candidate_details_url/$id')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        candidateDetails = CandidateDetails.fromJson(result);
        Commons.alertDialog(
            candidateDetails?.data.avatar,
            candidateDetails?.data.firstName,
            candidateDetails?.data.lastName,
            candidateDetails?.data.email);
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
