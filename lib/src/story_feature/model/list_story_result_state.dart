import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/story_feature/model/story.dart';

part 'list_story_result_state.freezed.dart';

@freezed
class ListStoryResultState with _$ListStoryResultState {
  const factory ListStoryResultState.loading() = ListStoryResultStateLoading;
  const factory ListStoryResultState.noData(String message) = ListStoryResultStateNoData;
  const factory ListStoryResultState.hasData(List<Story> data) = ListStoryResultStateHasData;
  const factory ListStoryResultState.error(String message) = ListStoryResultStateStateError;
}