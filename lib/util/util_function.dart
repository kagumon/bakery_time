String secondFormatHHMMSS(int second) {
  int hh = second ~/ 3600;
  int tmpSecond = second % 3600;
  int mm = tmpSecond ~/ 60;
  int ss = tmpSecond % 60;
  String rhh = hh.toString().padLeft(2, '0');
  String rmm = mm.toString().padLeft(2, '0');
  String rss = ss.toString().padLeft(2, '0');
  return "$rhh:$rmm:$rss";
}
