import 'package:daily_purify/mvp/presenter/StoryDetailPresenter.dart';
import 'package:daily_purify/mvp/repository/StoryDetailRepository.dart';
import 'package:daily_purify/mvp/repository/StoryDetailRepositoryImpl.dart';

class StoryDetailPresenterImpl implements StoryDetailPresenter {

  StoryDetailView _view;

  StoryDetailRepository _repository;

  StoryDetailPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  init() {
    _repository = new StoryDetailRepositoryImpl();
  }

  @override
  loadStoryDetail(String id) {
    assert(_view != null);
    _repository.loadStoryDetail(id).then((data) {

      _view.onLoadStoryDetailSuc(data);
    })
        .catchError((error) {
      _view.onLoadStoryDetailFail();
    });
  }

  @override
  loadStoryExtra(String id) {
    assert(_view != null);
    _repository.loadStoryExtra(id).then((data) {
      _view.onLoadStoryExtraSuc(data);
    }).catchError((error) {
      _view.onLoadStoryExtraFail();
    });
  }
}
