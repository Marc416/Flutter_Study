

const String urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String userKey = 'sample';
const String urlSuffix = '/json/realtimeStationArrival/1/5/';
const String defaultStation = '광화문';
const int STATUS_OK = 200;

//  공공데이터 json을 url로 읽어오기
String buildUrl(String station) {
  StringBuffer sb = StringBuffer();
  sb.write(urlPrefix);
  sb.write(userKey);
  sb.write(urlSuffix);
  sb.write(station);
  return sb.toString();
}