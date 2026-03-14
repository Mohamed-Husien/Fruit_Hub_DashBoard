import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presenatation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presenatation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presenatation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presenatation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName;
  late num productPrice, expirationMoths, numberOfCalories, unitAmount;
  late String productCode;
  late String productDescription;
  File? image;
  bool isFeatured = false;
  bool isOragnic = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                  onSaved: (value) {
                    productName = value!;
                  },
                  hintText: "Product Name",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    productPrice = num.parse(value!);
                  },
                  hintText: "Product Price",
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    expirationMoths = num.parse(value!);
                  },
                  hintText: " Expiration Months  ",
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    numberOfCalories = num.parse(value!);
                  },
                  hintText: " Number Of Calories",
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  },
                  hintText: "Unit Amount",
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    productCode = value!.toLowerCase();
                  },
                  hintText: "Product Code",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  productDescription = value!;
                },
                hintText: "Product Description",
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOragnic = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onImagePicked: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ProductEntity product = ProductEntity(
                            code: productCode,
                            reviews: [],
                            isOrganic: isOragnic,
                            expirationMonths: expirationMoths.toInt(),
                            numberOfCalories: numberOfCalories.toInt(),
                            unitAmount: unitAmount.toInt(),
                            name: productName,
                            price: productPrice,
                            productCode: productCode,
                            description: productDescription,
                            image: image!,
                            isFeatured: isFeatured);
                        BlocProvider.of<AddProductCubit>(context)
                            .addProduct(product);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      showError(context);
                    }
                  },
                  text: "Add Product"),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please select an image for the product."),
      ),
    );
  }
}
