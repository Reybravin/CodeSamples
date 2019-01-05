//Result type

enum Result<Value, Error: Swift.Error> {
   case success(Value)
   case failure(Error)
}

/*
typealias Handler = (Result<Data, LoadingError>) -> Void

func load(then handler: @escaping Handler) {
   //
}

load { [weak self] result in
   switch result {
   case .success(let data):
      self?.handle(data)
   case .failure(let error):
      // Since we now know the type of 'error', we can easily
      // switch on it to perform much better error handling
      // for each possible type of error.
      switch error {
      case .networkUnavailable:
         self?.showErrorView(withMessage: .offline)
      case .timedOut:
         self?.showErrorView(withMessage: .timedOut)
      case .invalidStatusCode(let code):
         self?.showErrorView(withMessage: .statusCode(code))
      }
   }
}
*/

extension Result {
   func resolve() throws -> Value {
      switch self {
      case .success(let value):
         return value
      case .failure(let error):
         throw error
      }
   }
}

//class SearchResultsLoaderTests: XCTestCase {
//   func testLoadingSingleResult() throws {
//      let engine = NetworkEngineMock.makeForSearchResults(named: ["Query"])
//      let loader = SearchResultsLoader(networkEngine: engine)
//      var result: Result<[SearchResult], SearchResultsLoader.Error>?
//      
//      loader.loadResults(matching: "query") {
//         result = $0
//      }
//
//      let searchResults = try result?.resolve()
//      XCTAssertEqual(searchResults?.count, 1)
//      XCTAssertEqual(searchResults?.first?.name, "Query")
//   }
//}


extension Result where Value == Data {
   func decoded<T: Decodable>() throws -> T {
      let decoder = JSONDecoder()
      let data = try resolve()
      return try decoder.decode(T.self, from: data)
   }
}

/*
load { [weak self] result in
   do {
      let user = try result.decoded() as User
      self?.userDidLoad(user)
   } catch {
      self?.handle(error)
   }
}
*/

class LoadingError : Error {}
