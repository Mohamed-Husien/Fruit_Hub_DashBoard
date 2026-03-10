import 'dart:io';

import 'package:fruit_hub_dashboard/constants.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/secret_key.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static createBucket(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExist = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupaBaseUrl,
      anonKey: kSupaBaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    await _supabase.client.storage
        .from('fruit_images')
        .upload("$path/$fileName.$extensionName", file);

    final String publicUrl = _supabase.client.storage
        .from('fruit_images')
        .getPublicUrl('$path/$fileName.$extensionName');
    return publicUrl;
  }
}
