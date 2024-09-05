import 'package:joshgervais/providers/search_provider.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/drop_down_provider.dart';
import '../providers/image_picker_provider.dart';
import '../providers/question_provider.dart';

var providers = [
  ChangeNotifierProvider<AuthProvider>(
    create: ((context) => AuthProvider()),
  ),
  ChangeNotifierProvider<QuestionProvider>(
    create: ((context) => QuestionProvider()),
  ),
  ChangeNotifierProvider<DropDownProvider>(
      create: ((context) => DropDownProvider())),
  ChangeNotifierProvider<ImagePickerProvider>(
      create: ((context) => ImagePickerProvider())),
  ChangeNotifierProvider<SearchProvider>(
    create: ((context) => SearchProvider()),
  ),
];
