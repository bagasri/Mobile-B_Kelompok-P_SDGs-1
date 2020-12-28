class Config{
  static const String apiBaseUrl = "https://jobs.github.com/";
  static const String positions = "positions";
  static const String all = "positions.json";
  static const String appLink= "https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_octo_job_search";
  

  static String filerJob({int pageNo = 1,String description,String location,bool isFullTime}) {
    String url =  "positions.json?";
    if(description != null && description.isNotEmpty){
      url +="search=$description";
    }if(location != null && location.isNotEmpty){
      url += "&location=$location";
    }
    if(isFullTime != null){
      url += "&full_time=$isFullTime";
    }
    if(pageNo != null){
      url += "&page=$pageNo";
    }else{
      url += "1";
    }
    return url;
  }
}