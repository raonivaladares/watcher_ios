import Foundation
import SwiftyJSON

public struct APIConfigurationNetworkModel {
    let images: Images
}

extension APIConfigurationNetworkModel {
    init(json: JSON) throws {
        do {
            images = try Images(json: json)
        } catch {
            throw error
        }
    }
}

