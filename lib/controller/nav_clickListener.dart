// ignore_for_file: file_names
bool homeScr = true;
String pageTitle = '';  // 앱바 타이틀 기본값

void navTapClicklistener(pageIndex){
  if (pageIndex == 0) {
    pageTitle = '홈';
    homeScr = true;
  } else if (pageIndex == 1) {
    pageTitle = '리스트';
    homeScr = false;
  } else if (pageIndex == 2) {
    pageTitle = '플레이';
    homeScr = false;
  }
}