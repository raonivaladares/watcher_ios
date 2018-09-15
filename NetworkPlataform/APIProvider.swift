import Foundation
import Alamofire

public struct APIProvider {
	let watchServer: WatcherServer
	
	public init() {
		watchServer = WatcherServer(apiConfiguration: APIProviderConfiguration())
	}
}

extension APIProvider {
	public func guestSessionNetwork() -> GuestSessionNetwork {
		
		return GuestSessionNetwork(watchServer: watchServer)
	}

}

extension APIProvider {
	public func searchContentNetwork() -> SearchContentNetwork {
		
		return SearchContentNetwork(watchServer: watchServer)
	}
}

//TODO: Setup configurarion here
// ex:
//
//	public func makeCommentsNetwork() -> CommentsNetwork {
//		let network = Network<Comment>(apiEndpoint)
//		return CommentsNetwork(network: network)
//	}
