import 'package:galaxy/domain/entity/home_entity.dart';

class HomeModel {
  String? status;
  String? copyright;
  int? numResults;
  List<Results>? results;

  HomeModel({this.status, this.copyright, this.numResults, this.results});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results extends HomeEntity {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? articleSource;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  Null? column;
  String? byline;
  String? type;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Media>? media;
  int? etaId;

  Results({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.articleSource,
    required String image,
    required String mainTitle,
    required String description,
    required String publishDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  }) : super(
          image: image,
          mainTitle: mainTitle,
          description: description,
          publishDate: publishDate,
          article: section ?? '',
          author: byline ?? '',
          source: subsection ?? '',
        );

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      uri: json['uri'],
      url: json['url'],
      id: json['id'],
      assetId: json['asset_id'],
      articleSource: json['source'],
      image: json['media'] != null && json['media'].isNotEmpty
          ? json['media'][0]['media-metadata'][0]['url'] ?? ''
          : '',
      mainTitle: json['title'] ?? '',
      description: json['abstract'] ?? '',
      publishDate: json['published_date'] ?? '',
      updated: json['updated'],
      section: json['section'],
      subsection: json['subsection'],
      nytdsection: json['nytdsection'],
      adxKeywords: json['adx_keywords'],
      column: json['column'],
      byline: json['byline'],
      type: json['type'],
      desFacet: json['des_facet']?.cast<String>(),
      orgFacet: json['org_facet']?.cast<String>(),
      perFacet: json['per_facet']?.cast<String>(),
      geoFacet: json['geo_facet']?.cast<String>(),
      media: json['media'] != null
          ? (json['media'] as List).map((v) => Media.fromJson(v)).toList()
          : null,
      etaId: json['eta_id'],
    );
  }
}

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata>? mediaMetadata;

  Media(
      {this.type,
      this.subtype,
      this.caption,
      this.copyright,
      this.approvedForSyndication,
      this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      mediaMetadata = <MediaMetadata>[];
      json['media-metadata'].forEach((v) {
        mediaMetadata!.add(MediaMetadata.fromJson(v));
      });
    }
  }
}

class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({this.url, this.format, this.height, this.width});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }
}
