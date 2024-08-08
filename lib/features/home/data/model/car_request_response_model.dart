class CarResponseModel {
  int? status;
  String? statusText;
  String? error;
  String? message;
  List<Data>? data;

  CarResponseModel(
      {this.status, this.statusText, this.error, this.message, this.data});

  CarResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusText = json['statusText'];
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusText'] = this.statusText;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? orgId;
  String? orgName;
  String? dataType;
  int? planId;
  String? planName;
  int? requireSurvey;
  int? priceId;
  double? percent;
  String? from;
  String? to;
  String? licenced;
  int? total;
  int? matchedBenefitsCount;
  String? matchedBenefitsIds;
  String? matchedBenefitsNames;

  Data({
    this.orgId,
    this.orgName,
    this.dataType,
    this.planId,
    this.planName,
    this.requireSurvey,
    this.priceId,
    this.percent,
    this.from,
    this.to,
    this.licenced,
    this.total,
    this.matchedBenefitsCount,
    this.matchedBenefitsIds,
    this.matchedBenefitsNames,
  });

  Data.fromJson(Map<String, dynamic> json) {
    orgId = json['org_id'];
    orgName = json['org_name'];
    dataType = json['data_type'];
    planId = json['plan_id'];
    planName = json['plan_name'];
    requireSurvey = json['require_survey'];
    priceId = json['price_id'];
    percent = json['percent'];
    from = json['from'];
    to = json['to'];
    licenced = json['licenced'];
    total = json['total'];
    matchedBenefitsCount = json['matched_benefits_count'];
    matchedBenefitsIds = json['matched_benefits_ids'];
    matchedBenefitsNames = json['matched_benefits_names'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['org_id'] = this.orgId;
    data['org_name'] = this.orgName;
    data['data_type'] = this.dataType;
    data['plan_id'] = this.planId;
    data['plan_name'] = this.planName;
    data['require_survey'] = this.requireSurvey;
    data['price_id'] = this.priceId;
    data['percent'] = this.percent;
    data['from'] = this.from;
    data['to'] = this.to;
    data['licenced'] = this.licenced;
    data['total'] = this.total;
    data['matched_benefits_count'] = this.matchedBenefitsCount;
    data['matched_benefits_ids'] = this.matchedBenefitsIds;
    data['matched_benefits_names'] = this.matchedBenefitsNames;
    return data;
  }
}
