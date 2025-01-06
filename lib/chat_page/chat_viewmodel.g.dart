// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatViewmodelHash() => r'82c9cc597521274d38c34add6c52e3731bfd2f24';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatViewmodel extends BuildlessAutoDisposeNotifier<void> {
  late final String roomNo;

  void build(
    String roomNo,
  );
}

/// See also [ChatViewmodel].
@ProviderFor(ChatViewmodel)
const chatViewmodelProvider = ChatViewmodelFamily();

/// See also [ChatViewmodel].
class ChatViewmodelFamily extends Family<void> {
  /// See also [ChatViewmodel].
  const ChatViewmodelFamily();

  /// See also [ChatViewmodel].
  ChatViewmodelProvider call(
    String roomNo,
  ) {
    return ChatViewmodelProvider(
      roomNo,
    );
  }

  @override
  ChatViewmodelProvider getProviderOverride(
    covariant ChatViewmodelProvider provider,
  ) {
    return call(
      provider.roomNo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatViewmodelProvider';
}

/// See also [ChatViewmodel].
class ChatViewmodelProvider
    extends AutoDisposeNotifierProviderImpl<ChatViewmodel, void> {
  /// See also [ChatViewmodel].
  ChatViewmodelProvider(
    String roomNo,
  ) : this._internal(
          () => ChatViewmodel()..roomNo = roomNo,
          from: chatViewmodelProvider,
          name: r'chatViewmodelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatViewmodelHash,
          dependencies: ChatViewmodelFamily._dependencies,
          allTransitiveDependencies:
              ChatViewmodelFamily._allTransitiveDependencies,
          roomNo: roomNo,
        );

  ChatViewmodelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomNo,
  }) : super.internal();

  final String roomNo;

  @override
  void runNotifierBuild(
    covariant ChatViewmodel notifier,
  ) {
    return notifier.build(
      roomNo,
    );
  }

  @override
  Override overrideWith(ChatViewmodel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatViewmodelProvider._internal(
        () => create()..roomNo = roomNo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomNo: roomNo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ChatViewmodel, void> createElement() {
    return _ChatViewmodelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatViewmodelProvider && other.roomNo == roomNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatViewmodelRef on AutoDisposeNotifierProviderRef<void> {
  /// The parameter `roomNo` of this provider.
  String get roomNo;
}

class _ChatViewmodelProviderElement
    extends AutoDisposeNotifierProviderElement<ChatViewmodel, void>
    with ChatViewmodelRef {
  _ChatViewmodelProviderElement(super.provider);

  @override
  String get roomNo => (origin as ChatViewmodelProvider).roomNo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
