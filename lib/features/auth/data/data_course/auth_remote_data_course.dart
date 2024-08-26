import 'package:bloc_app/core/error/exceptions.dart';
import 'package:bloc_app/features/auth/data/models/user_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource{
  Session? get currentSession;
  Future<UserModels>  signUpWithEmailAndPassword({
    required String name, required String email, required String password,
  });

  Future<UserModels> loginWithEmailAndPassword({
    required String email, required String password,
  });
  Future<UserModels?> getCurrentUserData();
}


class AuthRemoteDataCourseImple implements AuthRemoteDataSource{
  final SupabaseClient supabaseClient;
  AuthRemoteDataCourseImple({required this.supabaseClient});
  @override
  Future<UserModels> loginWithEmailAndPassword({required String email, required String password}) async{

    try{
      final responce = await supabaseClient.auth.signInWithPassword(password: password, email: email);
      if (responce.user == null){
        throw const ServerException('User is null');
      }
    } catch(e){
      ServerException(e.toString());
    }

    throw UnimplementedError();
  }

  @override
  Future<UserModels> signUpWithEmailAndPassword({required String name, required String email, required String password}) async{
    try{
      final response = await supabaseClient.auth.signUp(password: password, email: email,data: {'name' : name});
      if (response.user == null){
        throw const ServerException('User is null');
      }
      return UserModels.fromJson(response.user!.toJson());
    }
    catch(e){
      ServerException(e.toString());
    }
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentSession
  Session? get currentSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModels?> getCurrentUserData() async{
    try{
      if (currentSession != null){
        final userData = await supabaseClient.from('profiles').select().eq('id', currentSession!.user.id);
        return UserModels.fromJson(userData.first).copyWith(email: currentSession!.user.email);
      }
      return null;
    }catch(e){
     throw ServerException(e.toString());
    }
    throw UnimplementedError();
  }
}
// TODO: что то 
