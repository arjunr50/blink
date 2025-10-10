import 'package:auto_route/auto_route.dart';
import 'package:blink/app/routes/app_router.gr.dart';
import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/core/di/inject.dart';
import 'package:blink/core/error/failure.dart';
import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/features/product/domain/usecase/product_list_usecase.dart';
import 'package:blink/features/product/presentation/widgets/category.dart';
import 'package:blink/features/product/presentation/widgets/product_card.dart';
import 'package:blink/shared/widgets/common_button.dart';
import 'package:blink/shared/widgets/custom_app_bar.dart';
import 'package:blink/shared/widgets/custom_text_field.dart';
import 'package:blink/shared/widgets/no_data_widget.dart';
import 'package:blink/shared/widgets/shimmer/product_shimmer.dart';
import 'package:blink/shared/widgets/svg_card.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:collection/collection.dart';


part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';
part 'package:blink/features/product/presentation/pages/product_page.dart';
part 'package:blink/features/product/presentation/pages/product_detail_page.dart';
part 'package:blink/features/product/presentation/pages/product_search_page.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductListUseCase productListUseCase;

  ProductBloc(this.productListUseCase) : super(const ProductState()) {
    on<_GetProducts>((event, emit) async {
      emit(state.copyWith(productListInProgress: true));
      final result = await productListUseCase("");
      result.fold(
        (failure) => emit(
          state.copyWith(
            productListInProgress: false,
            productListFailed: failure,
          ),
        ),
        (result) => emit(
          state.copyWith(
            productListInProgress: false,
            productListSuccess: true,
            products: result,
          ),
        ),
      );
    });
  }
}
