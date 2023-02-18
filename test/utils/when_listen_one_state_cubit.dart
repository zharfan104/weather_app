import 'package:bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

void whenListenOneStateCubit<State>(
  BlocBase<State> bloc,
  State inputState, {
  State? initialState,
}) {
  final stream = Stream.fromIterable([inputState]);

  final broadcastStream = stream.asBroadcastStream();

  when(() => bloc.state).thenReturn(initialState ?? inputState);

  when(() => bloc.stream).thenAnswer(
    (_) => broadcastStream.map((state) {
      when(() => bloc.state).thenReturn(state);

      return state;
    }),
  );
}
