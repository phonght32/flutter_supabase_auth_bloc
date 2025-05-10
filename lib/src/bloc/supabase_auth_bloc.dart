import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_auth_repo/supabase_auth_repo.dart';

part 'supabase_auth_event.dart';
part 'supabase_auth_state.dart';

class SupabaseAuthBloc extends Bloc<SupabaseAuthEvent, SupabaseAuthState> {
  final SupabaseAuthRepo _supabaseAuthRepo;

  SupabaseAuthBloc({
    required SupabaseAuthRepo supabaseAuthRepo,
  }) : _supabaseAuthRepo = supabaseAuthRepo,
        super(SupabaseAuthStateUnknown()) {
    on<SupabaseAuthEventAppStarted>(_onAppStarted);
    on<SupabaseAuthEventRequestedLogIn>((event, emit) async {
      if (_supabaseAuthRepo.isLoggedIn() == true) {
        final user = _supabaseAuthRepo.user;
        emit(SupabaseAuthStateAuthenticated(user: user));
      }
    });
    on<SupabaseAuthEventRequestedLogOut>((event, emit) async {
      await _supabaseAuthRepo.logOut();
      emit(SupabaseAuthStateUnauthenticated());
    });
  }

  Future<void> _onAppStarted(
      SupabaseAuthEventAppStarted event,
    Emitter<SupabaseAuthState> emit
  ) async {
    try  {
      if (_supabaseAuthRepo.isLoggedIn() == true) {
        final user = _supabaseAuthRepo.user;
        return emit(SupabaseAuthStateAuthenticated(user: user));
      } else {
        return emit(SupabaseAuthStateUnauthenticated());
      }
    } catch (_) {
      return emit(SupabaseAuthStateUnauthenticated());
    }
  }
}