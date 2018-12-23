import Foundation
import SwiftyJSON

public extension APIConfigurationNetworkModel {
    public struct Images {
        let secureBaseURL: String
        let backDropSizes: [String]
    }
}


extension APIConfigurationNetworkModel.Images {
    init?(json: JSON) {
        
        guard
            let secureBaseURL = json["secure_base_url"].string,
            let sizes = json["backdrop_sizes"].array
        else { return nil }
        
        self.secureBaseURL = secureBaseURL
        backDropSizes = sizes.compactMap { $0.string }
    }
}
