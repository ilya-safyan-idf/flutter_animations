import 'package:presentation/base/bloc/bloc_data.dart';

abstract class Bloc<D> {
  Stream<BlocData<D?>> get dataStream;
  bool get loadingStatus;
  void initState();
  void dispose();
}
