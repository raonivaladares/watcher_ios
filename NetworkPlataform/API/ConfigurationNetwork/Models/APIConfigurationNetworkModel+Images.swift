import Foundation
import SwiftyJSON

public extension APIConfigurationNetworkModel {
    struct Images {
        public let secureBaseURL: String
        public let backDropSizes: [String]
        
        public init(secureBaseURL: String, backDropSizes: [String]) {
            self.secureBaseURL = secureBaseURL
            self.backDropSizes = backDropSizes
        }
    }
}


extension APIConfigurationNetworkModel.Images {
    enum jsonKey: String {
        case secureBaseUrl = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
    }
    
    init(json: JSON) throws {
        guard let secureBaseURL = json[jsonKey.secureBaseUrl.rawValue].string else {
            throw ModelError.jsonWithMissingKey(key: jsonKey.secureBaseUrl.rawValue)
        }
        
        guard !secureBaseURL.isEmpty else {
            throw ModelError.jsonWithInvalidInput(key: jsonKey.secureBaseUrl.rawValue)
        }
        
        guard let sizes = json[jsonKey.backdropSizes.rawValue].array else {
            throw ModelError.jsonWithMissingKey(key: jsonKey.backdropSizes.rawValue)
        }
        
        guard !sizes.isEmpty else {
            throw ModelError.jsonWithInvalidInput(key: jsonKey.backdropSizes.rawValue)
        }
        
        self.secureBaseURL = secureBaseURL
        backDropSizes = sizes.compactMap { $0.string }
    }
}
