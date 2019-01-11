import Foundation

public struct ConfigurarionDataModel {
    public let images: Images
    
    public init(images: Images) {
        self.images = images
    }
}

extension ConfigurarionDataModel {
    public struct Images: Codable {
        public let secureBaseURL: String
        public let backDropSizes: [String]
        
        public init(secureBaseURL: String, backDropSizes: [String]) {
            self.secureBaseURL = secureBaseURL
            self.backDropSizes = backDropSizes
        }
    }
}

extension ConfigurarionDataModel: Codable {}
