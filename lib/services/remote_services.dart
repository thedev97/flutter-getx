import '../core/remote_url.dart';
import 'package:http/http.dart' as http;
import 'package:job_login_getx/data/model/candidate_list.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<Candidate?> fetchCandidates() async {
    var response = await client.get(Uri.parse(candidate_list_url));
    if (response.statusCode == 200) {
      var data = response.body;
      return candidateFromJson(data);
    } else {
      return null;
    }
  }
}
