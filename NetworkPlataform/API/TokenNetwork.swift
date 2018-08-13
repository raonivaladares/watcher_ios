import Foundation
import Domain.Swift

//public final class AlbumsNetwork {
//	private let network: Network<Album>
//
//	init(network: Network<Album>) {
//		self.network = network
//	}
//
//	public func fetchAlbums() -> Observable<[Album]> {
//		return network.getItems("albums")
//	}
//
//	public func fetchAlbum(albumId: String) -> Observable<Album> {
//		return network.getItem("albums", itemId: albumId)
//	}
//}

public struct TokenNetwork {
	let watchServer: WatcherServer
	
	public func requestAPIToken() {
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.userValidation.requestToken,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		
		watchServer.execute(request: request) { result in
				let tokenR = RequestToken(success: false, expiresAt: Date(), token: "")
				result.analysis(ifSuccess: { json in
						print(json)
				}, ifFailure: { error in
					print(error)
				})
		}
	}
}
