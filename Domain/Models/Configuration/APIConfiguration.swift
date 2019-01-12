import Foundation

struct APIConfiguration: Codable {
    let images: Images
    
    init(images: Images) {
        self.images = images
    }
}

extension APIConfiguration {
    public struct Images: Codable {
        public let secureBaseURL: String
        public let backDropSizes: [String]
    }
}
