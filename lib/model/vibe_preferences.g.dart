// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vibe_preferences.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVibePreferencesCollection on Isar {
  IsarCollection<VibePreferences> get vibePreferences => this.collection();
}

const VibePreferencesSchema = CollectionSchema(
  name: r'VibePreferences',
  id: -5059407529952187022,
  properties: {
    r'darkMode': PropertySchema(
      id: 0,
      name: r'darkMode',
      type: IsarType.bool,
    ),
    r'notification': PropertySchema(
      id: 1,
      name: r'notification',
      type: IsarType.bool,
    ),
    r'skin': PropertySchema(
      id: 2,
      name: r'skin',
      type: IsarType.long,
    ),
    r'vibration': PropertySchema(
      id: 3,
      name: r'vibration',
      type: IsarType.bool,
    )
  },
  estimateSize: _vibePreferencesEstimateSize,
  serialize: _vibePreferencesSerialize,
  deserialize: _vibePreferencesDeserialize,
  deserializeProp: _vibePreferencesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vibePreferencesGetId,
  getLinks: _vibePreferencesGetLinks,
  attach: _vibePreferencesAttach,
  version: '3.1.0+1',
);

int _vibePreferencesEstimateSize(
  VibePreferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _vibePreferencesSerialize(
  VibePreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.darkMode);
  writer.writeBool(offsets[1], object.notification);
  writer.writeLong(offsets[2], object.skin);
  writer.writeBool(offsets[3], object.vibration);
}

VibePreferences _vibePreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VibePreferences();
  object.darkMode = reader.readBoolOrNull(offsets[0]);
  object.id = id;
  object.notification = reader.readBoolOrNull(offsets[1]);
  object.skin = reader.readLongOrNull(offsets[2]);
  object.vibration = reader.readBoolOrNull(offsets[3]);
  return object;
}

P _vibePreferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vibePreferencesGetId(VibePreferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vibePreferencesGetLinks(VibePreferences object) {
  return [];
}

void _vibePreferencesAttach(
    IsarCollection<dynamic> col, Id id, VibePreferences object) {
  object.id = id;
}

extension VibePreferencesQueryWhereSort
    on QueryBuilder<VibePreferences, VibePreferences, QWhere> {
  QueryBuilder<VibePreferences, VibePreferences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VibePreferencesQueryWhere
    on QueryBuilder<VibePreferences, VibePreferences, QWhereClause> {
  QueryBuilder<VibePreferences, VibePreferences, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VibePreferencesQueryFilter
    on QueryBuilder<VibePreferences, VibePreferences, QFilterCondition> {
  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      darkModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'darkMode',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      darkModeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'darkMode',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      darkModeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      notificationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notification',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      notificationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notification',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      notificationEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notification',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      skinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skin',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      skinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skin',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      skinEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skin',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      skinGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skin',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      skinLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skin',
        value: value,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      skinBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      vibrationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vibration',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      vibrationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vibration',
      ));
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterFilterCondition>
      vibrationEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vibration',
        value: value,
      ));
    });
  }
}

extension VibePreferencesQueryObject
    on QueryBuilder<VibePreferences, VibePreferences, QFilterCondition> {}

extension VibePreferencesQueryLinks
    on QueryBuilder<VibePreferences, VibePreferences, QFilterCondition> {}

extension VibePreferencesQuerySortBy
    on QueryBuilder<VibePreferences, VibePreferences, QSortBy> {
  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortByNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortByNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy> sortBySkin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skin', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortBySkinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skin', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortByVibration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibration', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      sortByVibrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibration', Sort.desc);
    });
  }
}

extension VibePreferencesQuerySortThenBy
    on QueryBuilder<VibePreferences, VibePreferences, QSortThenBy> {
  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenByNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenByNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy> thenBySkin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skin', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenBySkinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skin', Sort.desc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenByVibration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibration', Sort.asc);
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QAfterSortBy>
      thenByVibrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibration', Sort.desc);
    });
  }
}

extension VibePreferencesQueryWhereDistinct
    on QueryBuilder<VibePreferences, VibePreferences, QDistinct> {
  QueryBuilder<VibePreferences, VibePreferences, QDistinct>
      distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QDistinct>
      distinctByNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notification');
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QDistinct> distinctBySkin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skin');
    });
  }

  QueryBuilder<VibePreferences, VibePreferences, QDistinct>
      distinctByVibration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vibration');
    });
  }
}

extension VibePreferencesQueryProperty
    on QueryBuilder<VibePreferences, VibePreferences, QQueryProperty> {
  QueryBuilder<VibePreferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VibePreferences, bool?, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }

  QueryBuilder<VibePreferences, bool?, QQueryOperations>
      notificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notification');
    });
  }

  QueryBuilder<VibePreferences, int?, QQueryOperations> skinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skin');
    });
  }

  QueryBuilder<VibePreferences, bool?, QQueryOperations> vibrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vibration');
    });
  }
}
