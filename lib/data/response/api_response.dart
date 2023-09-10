import 'status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? msg;

  ApiResponse(this.status, this.data, this.msg);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.success(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.msg) : status = Status.ERROR;

  @override
  String toString() {
    return "Status $status \n Message $msg \n Data $data";
  }
}