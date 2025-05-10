part of 'supabase_auth_bloc.dart';

class SupabaseAuthState extends Equatable {
  const SupabaseAuthState();

  @override
  List<Object> get props => [];
}

class SupabaseAuthStateUnknown extends SupabaseAuthState {}

class SupabaseAuthStateUnauthenticated extends SupabaseAuthState {}

class SupabaseAuthStateAuthenticated extends SupabaseAuthState {
  final SupabaseUser user;

  const SupabaseAuthStateAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

