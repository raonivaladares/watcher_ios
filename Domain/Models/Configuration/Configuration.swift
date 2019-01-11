import Foundation
import NetworkPlataform
import DataPlataform

struct Configuration: Codable {
    let images: Images
    
    init(images: Images) {
        self.images = images
    }
}

extension Configuration {
    public struct Images: Codable {
        public let secureBaseURL: String
        public let backDropSizes: [String]
    }
}

extension ConfigurarionDataModel {
    func asDomain() -> Configuration {
        let domainImages = images.asDomain()
        return Configuration(images: domainImages)
    }
}

extension ConfigurarionDataModel.Images {
    func asDomain() -> Configuration.Images {
        return Configuration.Images(secureBaseURL: secureBaseURL, backDropSizes: backDropSizes)
    }
}

extension APIConfigurationNetworkModel {
    func asDataPlataform() -> ConfigurarionDataModel {
        let dataPlataformImages = images.asDataPlataform()
        return ConfigurarionDataModel(images: dataPlataformImages)
    }
}

extension APIConfigurationNetworkModel.Images {
    func asDataPlataform() -> ConfigurarionDataModel.Images {
        return ConfigurarionDataModel.Images(secureBaseURL: secureBaseURL, backDropSizes: backDropSizes)
    }
}
