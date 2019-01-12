import Foundation
import SwiftyJSON

public struct APIConfigurationNetworkModel {
    public let images: Images
    
    public init(images: Images) {
        self.images = images
    }
}

extension APIConfigurationNetworkModel {
    init(json: JSON) throws {
        let imagesJson = json["images"]
        images = try Images(json: imagesJson)
    }
}

