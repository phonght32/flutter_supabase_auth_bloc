part of 'supabase_auth_bloc.dart';

sealed class SupabaseAuthEvent {
  const SupabaseAuthEvent();
}

final class SupabaseAuthEventAppStarted extends SupabaseAuthEvent {}

final class SupabaseAuthEventRequestedLogIn extends SupabaseAuthEvent {}

final class SupabaseAuthEventRequestedLogOut extends SupabaseAuthEvent {}

