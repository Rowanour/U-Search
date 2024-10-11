import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni/models/unis_model.dart';
import 'package:uni/services/uni_service.dart';

class UniCupit extends Cubit<List<Uni>> {
  UniCupit() : super([]) {
    getUni();
  }

  final _service = UniService();

  // Fetches data and prints it to console
  void getUni() async {
    try {
      final result = await _service.getUni();
      emit(result);
      _logFetchedData(result);
    } catch (e) {
      print("Error fetching data: $e");
    }
  }


  // Function to log the fetched data
  void _logFetchedData(List<Uni> universities) {
    print("Fetched Universities Data:");
    for (var uni in universities) {
      print('University Name: ${uni.name}');
      print('Description: ${uni.description}');
      print('Location: ${uni.location}');
      print('Fees: ${uni.fees}');
      print('---');
    }
  }
}
