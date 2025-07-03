import 'dart:async';

import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final _ids = <int>{2, 3, 4};
  // 싱글톤이기때문에 _controller 관찰하는데가 여러군데 있을수 있도록 하려면
  // broadcast() 생성자를 사용해야지 멀티로 관찰이 가능하다. 2군데 이상에서 관찰이 가능하다.
  // 단점은 관찰자가 없어도 데이터가 계속 흘러간다
  // 그말은 해당 탭을(페이지를) 클릭하지 않아도 호출이된다?
  // 그래서 첫데이터가 나오지 않는다. 첫데이터를 나오게 하려면 broadcast() 를 쓰면안된다.
  // final _controller = StreamController<Set<int>>.broadcast();
  // 하지만 다른 페이지에서도 북마크를 클릭을 하면 연동이 되어야 되기때문에 broadcast() 를 사용한다.
  // 하지만 처음호출할때 값이 안나오기때문에 스스로 만들거나 라이브러리를 사용해야된다.
  // 여기서는 rxdart 설치해서 사용한다. rxdart 에서 제공하는 BehaviorSubject 사용
  final _controller = BehaviorSubject<Set<int>>();
  // BehaviorSubject 는 broadcast 방식으로 동작을 하는데 관찰자가 있어야지만 데이터를 돌려준다.

  MockBookmarkRepositoryImpl(){
    _controller.add(_ids);
  }

  @override
  Future<void> clear() async {
    _ids.clear();
    _controller.add(_ids);
  }

  @override
  Future<List<int>> getBookmarkIds() async {
    return _ids.toList();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
    _controller.add(_ids);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      unSave(id);
    } else {
      save(id);
    }
    _controller.add(_ids);
  }

  @override
  Future<void> unSave(int id) async {
    _ids.remove(id);
    _controller.add(_ids);
  }

  @override
  Stream<Set<int>> bookmarkIdsStream() {
    return _controller.stream;
  }
}
