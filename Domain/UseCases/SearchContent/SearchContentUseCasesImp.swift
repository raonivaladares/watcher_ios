import Foundation
import NetworkPlataform

public struct SearchContentUseCasesImp: SearchContentUseCases {
	private let apiProvider: APIProvider
	
	public init() {
		apiProvider = APIProvider()
	}
	
	public func searchForMovie(queryString: String, completion: @escaping (Result<MovieSearchResult, DomainError>) -> Void) {
		apiProvider.searchContentNetwork().searchForMovie(queryString: queryString) { result in
            switch result {
            case .success(let movieSearchNetworkModel):
                completion(.success(movieSearchNetworkModel.asDomain()))
            case .failure(_):
                completion(.failure(DomainError.unknow))
            }
		}
	}
}
