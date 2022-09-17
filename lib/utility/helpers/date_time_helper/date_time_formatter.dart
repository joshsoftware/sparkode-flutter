class DateTimeFormatter{

  static String getDisplayDate(String date){
    DateTime d;
    String display;
    try{
      d = DateTime.parse(date);
    }
    catch(e){
      return "";
    }
    display = "${d.day}-${d.month}-${d.year}, ${d.hour}:${d.minute}";
    return display;
  }
}