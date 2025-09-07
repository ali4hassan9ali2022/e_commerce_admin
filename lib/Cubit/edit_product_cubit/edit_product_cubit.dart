import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit() : super(EditProductInitialState());
}