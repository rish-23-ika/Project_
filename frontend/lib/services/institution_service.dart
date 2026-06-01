import '../models/institution.dart';
import 'supabase_service.dart';

class InstitutionService {
  static Future<List<Institution>> getInstitutions() async {
    final response = await SupabaseService.client
        .from('institutions')
        .select();

    return response
        .map<Institution>(
          (item) => Institution.fromJson(item),
        )
        .toList();
  }
}