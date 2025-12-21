class BaseUrl {
  final String _BASEURL = "http://192.168.1.114:8001/api/v1";
  final String BASEURL = "http://192.168.1.114:8001/api/v1";

  // Correct URLs
  late final String LOGINURL_URL = "$_BASEURL/login";
  late final String REGISTER_SEND_CODE_URL = "$_BASEURL/register/request-code";
  late final String REGISTER_VERIFY_CODE_URL = "$_BASEURL/register/verify-code";
  late final String REGISTERCOMPLETE_URL = "$_BASEURL/register/complete";


  late final String LIST_URL = "$_BASEURL/task/list";
  late final String INSERT_DATA_URL = "$_BASEURL/task/store";



}
