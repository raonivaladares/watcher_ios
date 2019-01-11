import Foundation
import SwiftyJSON

public struct APIConfigurationNetworkModel {
    public let images: Images
}

extension APIConfigurationNetworkModel {
    init(json: JSON) throws {
        let imagesJson = json["images"]
        images = try Images(json: imagesJson)
    }
}

