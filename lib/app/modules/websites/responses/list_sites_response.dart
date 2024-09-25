class ListSitesResponse {
  final List<String> sites;

  ListSitesResponse({required this.sites});

  factory ListSitesResponse.fromMap(Map<String, dynamic> json) {
    List<dynamic> siteList = json['sites'];
    List<String> sites = siteList.map((site) => site.toString()).toList();
    return ListSitesResponse(sites: sites);
  }
}
