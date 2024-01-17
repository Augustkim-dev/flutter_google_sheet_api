class ListDataRepository {
  Future<String> test_calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'List Data Checked',
  );
}
