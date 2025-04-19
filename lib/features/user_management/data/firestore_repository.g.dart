// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreRepositoryHash() =>
    r'ae97bc6ef75bfe7811abd869d6a1ccd1b44b0e86';

/// See also [firestoreRepository].
@ProviderFor(firestoreRepository)
final firestoreRepositoryProvider =
    AutoDisposeProvider<FirestoreRepository>.internal(
      firestoreRepository,
      name: r'firestoreRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$firestoreRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirestoreRepositoryRef = AutoDisposeProviderRef<FirestoreRepository>;
String _$loadDonorsHash() => r'dd10a4feae9896796bd457393cff97da63431a44';

/// See also [loadDonors].
@ProviderFor(loadDonors)
final loadDonorsProvider = AutoDisposeStreamProvider<List<AppUser>>.internal(
  loadDonors,
  name: r'loadDonorsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadDonorsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoadDonorsRef = AutoDisposeStreamProviderRef<List<AppUser>>;
String _$loadSpecificBloodGroupDonorsHash() =>
    r'f8d417bf8a87f6e95702c83290811ff21c3ba3dd';

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

/// See also [loadSpecificBloodGroupDonors].
@ProviderFor(loadSpecificBloodGroupDonors)
const loadSpecificBloodGroupDonorsProvider =
    LoadSpecificBloodGroupDonorsFamily();

/// See also [loadSpecificBloodGroupDonors].
class LoadSpecificBloodGroupDonorsFamily
    extends Family<AsyncValue<List<AppUser>>> {
  /// See also [loadSpecificBloodGroupDonors].
  const LoadSpecificBloodGroupDonorsFamily();

  /// See also [loadSpecificBloodGroupDonors].
  LoadSpecificBloodGroupDonorsProvider call(String bloodGroup) {
    return LoadSpecificBloodGroupDonorsProvider(bloodGroup);
  }

  @override
  LoadSpecificBloodGroupDonorsProvider getProviderOverride(
    covariant LoadSpecificBloodGroupDonorsProvider provider,
  ) {
    return call(provider.bloodGroup);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadSpecificBloodGroupDonorsProvider';
}

/// See also [loadSpecificBloodGroupDonors].
class LoadSpecificBloodGroupDonorsProvider
    extends AutoDisposeStreamProvider<List<AppUser>> {
  /// See also [loadSpecificBloodGroupDonors].
  LoadSpecificBloodGroupDonorsProvider(String bloodGroup)
    : this._internal(
        (ref) => loadSpecificBloodGroupDonors(
          ref as LoadSpecificBloodGroupDonorsRef,
          bloodGroup,
        ),
        from: loadSpecificBloodGroupDonorsProvider,
        name: r'loadSpecificBloodGroupDonorsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadSpecificBloodGroupDonorsHash,
        dependencies: LoadSpecificBloodGroupDonorsFamily._dependencies,
        allTransitiveDependencies:
            LoadSpecificBloodGroupDonorsFamily._allTransitiveDependencies,
        bloodGroup: bloodGroup,
      );

  LoadSpecificBloodGroupDonorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bloodGroup,
  }) : super.internal();

  final String bloodGroup;

  @override
  Override overrideWith(
    Stream<List<AppUser>> Function(LoadSpecificBloodGroupDonorsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadSpecificBloodGroupDonorsProvider._internal(
        (ref) => create(ref as LoadSpecificBloodGroupDonorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bloodGroup: bloodGroup,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<AppUser>> createElement() {
    return _LoadSpecificBloodGroupDonorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadSpecificBloodGroupDonorsProvider &&
        other.bloodGroup == bloodGroup;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bloodGroup.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadSpecificBloodGroupDonorsRef
    on AutoDisposeStreamProviderRef<List<AppUser>> {
  /// The parameter `bloodGroup` of this provider.
  String get bloodGroup;
}

class _LoadSpecificBloodGroupDonorsProviderElement
    extends AutoDisposeStreamProviderElement<List<AppUser>>
    with LoadSpecificBloodGroupDonorsRef {
  _LoadSpecificBloodGroupDonorsProviderElement(super.provider);

  @override
  String get bloodGroup =>
      (origin as LoadSpecificBloodGroupDonorsProvider).bloodGroup;
}

String _$loadSimilarBloodGroupsHash() =>
    r'068b7ed54fe3d3862559a1fbbddeae33bc612604';

/// See also [loadSimilarBloodGroups].
@ProviderFor(loadSimilarBloodGroups)
const loadSimilarBloodGroupsProvider = LoadSimilarBloodGroupsFamily();

/// See also [loadSimilarBloodGroups].
class LoadSimilarBloodGroupsFamily extends Family<AsyncValue<List<AppUser>>> {
  /// See also [loadSimilarBloodGroups].
  const LoadSimilarBloodGroupsFamily();

  /// See also [loadSimilarBloodGroups].
  LoadSimilarBloodGroupsProvider call(String bloodGroup) {
    return LoadSimilarBloodGroupsProvider(bloodGroup);
  }

  @override
  LoadSimilarBloodGroupsProvider getProviderOverride(
    covariant LoadSimilarBloodGroupsProvider provider,
  ) {
    return call(provider.bloodGroup);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadSimilarBloodGroupsProvider';
}

/// See also [loadSimilarBloodGroups].
class LoadSimilarBloodGroupsProvider
    extends AutoDisposeStreamProvider<List<AppUser>> {
  /// See also [loadSimilarBloodGroups].
  LoadSimilarBloodGroupsProvider(String bloodGroup)
    : this._internal(
        (ref) => loadSimilarBloodGroups(
          ref as LoadSimilarBloodGroupsRef,
          bloodGroup,
        ),
        from: loadSimilarBloodGroupsProvider,
        name: r'loadSimilarBloodGroupsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadSimilarBloodGroupsHash,
        dependencies: LoadSimilarBloodGroupsFamily._dependencies,
        allTransitiveDependencies:
            LoadSimilarBloodGroupsFamily._allTransitiveDependencies,
        bloodGroup: bloodGroup,
      );

  LoadSimilarBloodGroupsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bloodGroup,
  }) : super.internal();

  final String bloodGroup;

  @override
  Override overrideWith(
    Stream<List<AppUser>> Function(LoadSimilarBloodGroupsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadSimilarBloodGroupsProvider._internal(
        (ref) => create(ref as LoadSimilarBloodGroupsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bloodGroup: bloodGroup,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<AppUser>> createElement() {
    return _LoadSimilarBloodGroupsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadSimilarBloodGroupsProvider &&
        other.bloodGroup == bloodGroup;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bloodGroup.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadSimilarBloodGroupsRef on AutoDisposeStreamProviderRef<List<AppUser>> {
  /// The parameter `bloodGroup` of this provider.
  String get bloodGroup;
}

class _LoadSimilarBloodGroupsProviderElement
    extends AutoDisposeStreamProviderElement<List<AppUser>>
    with LoadSimilarBloodGroupsRef {
  _LoadSimilarBloodGroupsProviderElement(super.provider);

  @override
  String get bloodGroup =>
      (origin as LoadSimilarBloodGroupsProvider).bloodGroup;
}

String _$loadNotificationsHash() => r'4ebaec9e004878a6a27851ed82d59f6204ba758e';

/// See also [loadNotifications].
@ProviderFor(loadNotifications)
const loadNotificationsProvider = LoadNotificationsFamily();

/// See also [loadNotifications].
class LoadNotificationsFamily
    extends Family<AsyncValue<List<AppNotification>>> {
  /// See also [loadNotifications].
  const LoadNotificationsFamily();

  /// See also [loadNotifications].
  LoadNotificationsProvider call(String userId) {
    return LoadNotificationsProvider(userId);
  }

  @override
  LoadNotificationsProvider getProviderOverride(
    covariant LoadNotificationsProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadNotificationsProvider';
}

/// See also [loadNotifications].
class LoadNotificationsProvider
    extends AutoDisposeStreamProvider<List<AppNotification>> {
  /// See also [loadNotifications].
  LoadNotificationsProvider(String userId)
    : this._internal(
        (ref) => loadNotifications(ref as LoadNotificationsRef, userId),
        from: loadNotificationsProvider,
        name: r'loadNotificationsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadNotificationsHash,
        dependencies: LoadNotificationsFamily._dependencies,
        allTransitiveDependencies:
            LoadNotificationsFamily._allTransitiveDependencies,
        userId: userId,
      );

  LoadNotificationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<AppNotification>> Function(LoadNotificationsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadNotificationsProvider._internal(
        (ref) => create(ref as LoadNotificationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<AppNotification>> createElement() {
    return _LoadNotificationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadNotificationsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadNotificationsRef
    on AutoDisposeStreamProviderRef<List<AppNotification>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _LoadNotificationsProviderElement
    extends AutoDisposeStreamProviderElement<List<AppNotification>>
    with LoadNotificationsRef {
  _LoadNotificationsProviderElement(super.provider);

  @override
  String get userId => (origin as LoadNotificationsProvider).userId;
}

String _$loadEmailedUserIdsHash() =>
    r'21571cb5af3129b55be0154fdbd5d203da528cd0';

/// See also [loadEmailedUserIds].
@ProviderFor(loadEmailedUserIds)
const loadEmailedUserIdsProvider = LoadEmailedUserIdsFamily();

/// See also [loadEmailedUserIds].
class LoadEmailedUserIdsFamily extends Family<AsyncValue<List<String>>> {
  /// See also [loadEmailedUserIds].
  const LoadEmailedUserIdsFamily();

  /// See also [loadEmailedUserIds].
  LoadEmailedUserIdsProvider call(String userId) {
    return LoadEmailedUserIdsProvider(userId);
  }

  @override
  LoadEmailedUserIdsProvider getProviderOverride(
    covariant LoadEmailedUserIdsProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadEmailedUserIdsProvider';
}

/// See also [loadEmailedUserIds].
class LoadEmailedUserIdsProvider
    extends AutoDisposeStreamProvider<List<String>> {
  /// See also [loadEmailedUserIds].
  LoadEmailedUserIdsProvider(String userId)
    : this._internal(
        (ref) => loadEmailedUserIds(ref as LoadEmailedUserIdsRef, userId),
        from: loadEmailedUserIdsProvider,
        name: r'loadEmailedUserIdsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadEmailedUserIdsHash,
        dependencies: LoadEmailedUserIdsFamily._dependencies,
        allTransitiveDependencies:
            LoadEmailedUserIdsFamily._allTransitiveDependencies,
        userId: userId,
      );

  LoadEmailedUserIdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<String>> Function(LoadEmailedUserIdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadEmailedUserIdsProvider._internal(
        (ref) => create(ref as LoadEmailedUserIdsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<String>> createElement() {
    return _LoadEmailedUserIdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadEmailedUserIdsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadEmailedUserIdsRef on AutoDisposeStreamProviderRef<List<String>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _LoadEmailedUserIdsProviderElement
    extends AutoDisposeStreamProviderElement<List<String>>
    with LoadEmailedUserIdsRef {
  _LoadEmailedUserIdsProviderElement(super.provider);

  @override
  String get userId => (origin as LoadEmailedUserIdsProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
