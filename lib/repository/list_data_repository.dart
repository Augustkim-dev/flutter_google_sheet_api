// api 호출 부분
// common에서 데이터 연결 호출 미리 해두고 결과 받아서 통신 호출
// request 보내고 responde 받아서 처리

class ListDataRepository {
  Future<String> test_calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () {
      return 'List Data Checked';
    },
  );

  Future<void> getConnect() async {}
}
