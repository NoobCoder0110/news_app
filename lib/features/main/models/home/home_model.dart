class NewsModel {
  final List<Result> results;

  NewsModel({
    required this.results,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e))
          .toList(),
    );
  }
}

class Result {
  final String slugName;
  final String section;
  final String? subsection;
  final String title;
  final String abstract;
  final String uri;
  final String url;
  final String byline;
  final String itemType;
  final String source;
  final DateTime updatedDate;
  final DateTime createdDate;
  final DateTime publishedDate;
  final DateTime firstPublishedDate;
  final String materialTypeFacet;
  final String? kicker;
  final String? subheadline;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<dynamic> relatedUrls;
  final List<Multimedia> multimedia;

  Result({
    required this.slugName,
    required this.section,
    this.subsection,
    required this.title,
    required this.abstract,
    required this.uri,
    required this.url,
    required this.byline,
    required this.itemType,
    required this.source,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.firstPublishedDate,
    required this.materialTypeFacet,
    this.kicker,
    this.subheadline,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.relatedUrls,
    required this.multimedia,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      slugName: json['slug_name'],
      section: json['section'],
      subsection: json['subsection'],
      title: json['title'],
      abstract: json['abstract'],
      uri: json['uri'],
      url: json['url'],
      byline: json['byline'],
      itemType: json['item_type'],
      source: json['source'],
      updatedDate: DateTime.parse(json['updated_date']),
      createdDate: DateTime.parse(json['created_date']),
      publishedDate: DateTime.parse(json['published_date']),
      firstPublishedDate: DateTime.parse(json['first_published_date']),
      materialTypeFacet: json['material_type_facet'],
      kicker: json['kicker'],
      subheadline: json['subheadline'],
      desFacet: List<String>.from(json['des_facet']),
      orgFacet: List<String>.from(json['org_facet']),
      perFacet: List<String>.from(json['per_facet']),
      geoFacet: List<String>.from(json['geo_facet']),
      relatedUrls: List<dynamic>.from(json['related_urls']),
      multimedia: (json['multimedia'] as List<dynamic>)
          .map((e) => Multimedia.fromJson(e))
          .toList(),
    );
  }
}

class Multimedia {
  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  Multimedia({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) {
    return Multimedia(
      url: json['url'],
      format: json['format'],
      height: json['height'],
      width: json['width'],
      type: json['type'],
      subtype: json['subtype'],
      caption: json['caption'],
      copyright: json['copyright'],
    );
  }
}
