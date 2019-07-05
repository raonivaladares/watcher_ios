import Foundation

public protocol ConfigurationNetwork {
    func requestConfiguration(completion: @escaping (Result<APIConfigurationNetworkModel, ServerError>) -> Void)
}

final class ConfigurationNetworkImp: ConfigurationNetwork {
	let watcherServer: WatcherServer
    
    init(watcherServer: WatcherServer) {
        self.watcherServer = watcherServer
    }
	
	public func requestConfiguration(completion: @escaping (Result<APIConfigurationNetworkModel, ServerError>) -> Void) {
		
		let parameters = ["api_key": watcherServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
                action: RouterAction.apiConfiguration.configuration,
                configuration: watcherServer.apiConfiguration
        )
			.parameters(parameters: parameters)
			.build()
		
		watcherServer.execute(request: request) { result in
            switch result {
            case .success(let json):
                do {
                    let configuration = try APIConfigurationNetworkModel(json: json)
                    completion(.success(configuration))
                } catch let error as ModelError {
                    //ParseError here
                    let serverError = WatcherServerErrorParser().parse(modelError: error)
                    completion(.failure(serverError))
                } catch {
                    completion(.failure(ServerError.unkown))
                }
            case .failure(let error):
                completion(.failure(error))
            }
		}
	}
}
