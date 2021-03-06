import "package:news/src/resources/news_api_provider.dart";
import "package:http/http.dart";
import "package:http/testing.dart";
import "dart:convert";
import "package:test/test.dart";

void main(){
  test("That FetchId returns Ids", () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async { return Response(json.encode([1,2,3,4]), 200);});

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1,2,3,4]);
  });

  test("FetchItem returns an object model", () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonObj = {"id":123};
      return Response(json.encode(jsonObj), 200);
    });

    final item = await newsApi.fetchItem(999);

    expect(item.id, 123 );
  });


}