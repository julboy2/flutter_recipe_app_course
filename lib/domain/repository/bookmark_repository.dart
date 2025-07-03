abstract interface class BookmarkRepository {
  Future<void> save(int id);

  Future<void> unSave(int id);

  Future<void> toggle(int id);

  Future<List<int>> getBookmarkIds();

  // 해당 탭(페이지) 에 갔을때마다 값을 불러오기위해 Stream 사용
  Stream<Set<int>> bookmarkIdsStream();

  Future<void> clear();
}
