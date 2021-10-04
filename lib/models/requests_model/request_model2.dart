class CreateRequestModel2{
  String? service,serviceId,state,localGovt,userId,requestId,title,description,budget;
  List<String>?subServices,skills;
  bool? requestStatus;
  String? date;
  CreateRequestModel2({required this.service,required this.serviceId,required this.state,required this.localGovt,required this.title,required this.requestId,required this.userId,
  required this.description,required this.budget,required this.subServices,required this.skills,required this.requestStatus,required this.date});
  CreateRequestModel2.fromMap(Map<dynamic,dynamic> json) {
    state = json['state'];
    service = json['service'];
    serviceId = json['serviceId'];
    state=json['state'];
    localGovt=json['localGovt'];
    userId = json['userId'];
    requestId=json['requestId'];
    title = json['title'];
    description = json['description'];
    budget = json['budget'];
    subServices = json['subServices'].cast<String>();
    skills = json['skills'].cast<String>();
    requestStatus = json['requestStatus'];
    date = json['date'];
  }
}