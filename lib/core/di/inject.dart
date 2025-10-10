import 'package:blink/core/constants/constants.dart';
import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/core/services/dio_client.dart';
import 'package:blink/features/product/data/repositories/product_repository_impl.dart';
import 'package:blink/features/product/domain/repositories/product_repository.dart';
import 'package:blink/features/product/domain/usecase/product_list_usecase.dart';
import 'package:blink/features/product/presentation/bloc/product_bloc.dart';
import 'package:blink/shared/models/order.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<CommonController>(
    () => CommonController(baseUrl: baseUrl),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton(
    () => DioClient(
      getIt(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ),
  );

  getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(getIt<DioClient>()),
  );

  getIt.registerLazySingleton<ProductListUseCase>(
        () => ProductListUseCase(getIt<ProductRepository>()),
  );

  getIt.registerFactory<ProductBloc>(
        () => ProductBloc(getIt<ProductListUseCase>()),
  );
  getIt.registerSingleton<List<Order>>([]);

}
