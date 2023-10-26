import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needToMakeButtonBigger = false;

  void toggleMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;

    state = state.copyWith(
        isExpanded: !state.isExpanded,
        isSmall: needToMakeButtonBigger ? false : true);

    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    if (state.isExpanded) {
      return;
    }

    state = state.copyWith(isSmall: isSmall);
  }
}

// final floatingButtonIsExpandedProvider = StateProvider((ref) => false);
// final floatingButtonIsSmallProvider = StateProvider((ref) => false);
