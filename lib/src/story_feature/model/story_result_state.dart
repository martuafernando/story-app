import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/story_feature/model/story.dart';

part 'story_result_state.freezed.dart';

@freezed
class StoryResultState with _$StoryResultState {
  const factory StoryResultState.loading() = StoryResultStateLoading;
  const factory StoryResultState.noData(String message) = StoryResultStateNoData;
  const factory StoryResultState.hasData(Story data) = StoryResultStateHasData;
  const factory StoryResultState.error(String message) = StoryResultStateStateError;
}