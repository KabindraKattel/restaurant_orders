/// heading : {"SITE_MUN_NAME":"ताप्ली गाउँ पालिका","SITE_TYPE":"गाउँ कार्यपालिकाको कार्यालय","SITE_PROVINCE":"प्रदेश नं १","SITE_ADDRESS":"ताप्ली,नेपाल"}
/// website : [{"title":"रासायनिक मल मापन","alias":"calculator","url":"calculator","icon":"http://192.168.1.70:8000/fertilizer/potash.png","is_button":true,"child":null},{"title":"हाम्रो बारेमा","alias":"about_us","url":"dashboard.about_us","icon":"http://192.168.1.70:8000/farm/about.png","is_button":true,"child":null},{"title":"सम्पर्क","alias":"contact_us","url":"dashboard.contact_us","icon":"http://192.168.1.70:8000/farm/contact.png","is_button":true,"child":null},{"title":"सूचना","alias":"notice","url":"dashboard.notice","icon":"http://192.168.1.70:8000/farm/notice.png","is_button":false,"child":null},{"title":"प्रकाशन","alias":"publication","url":"dashboard.publication","icon":"http://192.168.1.70:8000/farm/publication.png","is_button":true,"child":null},{"title":"कृषि तथा पशुपंक्षी सम्बन्धि आधारभुत जानकारी","alias":"agriculture-animal","url":"agriculture-animal","storage_url":"http://192.168.1.70:8000/storage/crop","icon":"http://192.168.1.70:8000/farm/farm-animal.png","is_button":false,"child":[{"id":1,"title":"धान खेति प्रबिधि","featured_image":"rice-gAki4YLSPK.png"},{"id":2,"title":"गोलभेडा खेति प्रबिधि","featured_image":"tomato-Yw4R9NdmKQ.png"},{"id":3,"title":"parichaya","featured_image":"Screenshot (2)-tnsJn1K9PK.png"}]},{"title":"कृषि प्रबिधि","alias":"agricuture-technology","url":"agriculture-technology","storage_url":"http://192.168.1.70:8000/storage/food","icon":"http://192.168.1.70:8000/farm/fram-technology.png","is_button":false,"child":[{"id":1,"title":"खाधान्न बाली","featured_image":"foot-grains-0ZaC3QvQZv.png"},{"id":2,"title":"नगदे बाली","featured_image":"Cash crop-2G0GjukJJO.png"},{"id":3,"title":"दलहन बाली","featured_image":"Pulses-5NlRXS4Czs.png"},{"id":5,"title":"तरकारी बाली","featured_image":"vegetable-WPgQ6mAzdV.png"}]},{"title":"बारम्बार सोधिने प्रश्नहरु","alias":"general-question","url":"general-question","storage_url":"http://192.168.1.70:8000/storage/food","icon":"http://192.168.1.70:8000/farm/question.png","is_button":false,"child":[{"id":1,"title":"खाधान्न बाली","featured_image":"foot-grains-0ZaC3QvQZv.png"},{"id":2,"title":"नगदे बाली","featured_image":"Cash crop-2G0GjukJJO.png"},{"id":3,"title":"दलहन बाली","featured_image":"Pulses-5NlRXS4Czs.png"},{"id":5,"title":"तरकारी बाली","featured_image":"vegetable-WPgQ6mAzdV.png"}]},{"title":"कृषि तथा पशुपंक्षी बिमा जानकारी","alias":"insurance","url":"dashboard.insurance","icon":"http://192.168.1.70:8000/farm/insurance.png","is_button":false,"child":null},{"title":"कृषि - मौसम सल्लाह बुलेटिन","alias":"agriculture_weather","url":"dashboard.agriculture_weather","icon":"http://192.168.1.70:8000/farm/weather.png","is_button":false,"child":null},{"title":"ब्यबसायिक योजना बनाउन जान्नु पर्ने आधारभूत जानकारी","alias":"marketing_plan","url":"dashboard.marketing_plan","icon":"http://192.168.1.70:8000/farm/notebook.png","is_button":false,"child":null}]

class AssetModel {
  String? coName;
  String? coAddress;
  String? coTelMail;

  AssetModel({this.coName, this.coAddress, this.coTelMail});

  AssetModel.fromJson(Map<String, dynamic> json) {
    coName = json['CoName'];
    coAddress = json['CoAddress'];
    coTelMail = json['CoTelMail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CoName'] = this.coName;
    data['CoAddress'] = this.coAddress;
    data['CoTelMail'] = this.coTelMail;
    return data;
  }
}
