part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class ChangeCheckBoxState extends AddressState {}

/* ---------------------- get address information state --------------------- */
final class GetAddressLoadingState extends AddressState {}

final class GetAddressSuccessState extends AddressState {}

final class GetAddressErrorState extends AddressState {}

/* ---------------------- post address information state --------------------- */
final class PostAddressLoadingState extends AddressState {}

final class PostAddressSuccessState extends AddressState {}

final class PostAddressErrorState extends AddressState {}
