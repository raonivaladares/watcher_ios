import Foundation
//import NetworkPlataform

//struct SearchContentUseCases {
//	private let apiProvider: APIProvider
//	
//	init() {
//		apiProvider = APIProvider()
//	}
//	
//	func requestGuestSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {//
//		apiProvider.guestSessionNetwork().requestGuestSessionToken { result in
//			if let session = result.value {
//				self.localDataProvider.session = session
//			}
//			completion(result.bimap(success: { _ in }, failure: { _ in ViewModelError(title: "a", message: "aaa") }))
//			//			completion(result.map { $0 }.mapError(ViewModelError.init))
//		}
//	}
//}
//
