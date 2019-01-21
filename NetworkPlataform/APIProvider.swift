import Foundation
import Alamofire

public final class APIProvider {
	private let watchServer: WatcherServer
	
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

extension APIProvider {
    public func apiConfiguration() -> ConfigurationNetwork {
        
        return ConfigurationNetworkImp(watcherServer: watchServer)
    }
}

//TODO: Setup configurarion here
// ex:
//
//	public func makeCommentsNetwork() -> CommentsNetwork {
//		let network = Network<Comment>(apiEndpoint)
//		return CommentsNetwork(network: network)
//	}
