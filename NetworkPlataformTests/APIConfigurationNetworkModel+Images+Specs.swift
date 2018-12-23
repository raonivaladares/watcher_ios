
import Quick
import Nimble
import SwiftyJSON

@testable import NetworkPlataform

final class APIConfigurationNetworkModelImagesSpecs: QuickSpec {
    override func spec() {
        
        describe("APIConfigurationNetworkModel.Images") {
            context("init") {
                let imagesJSONStringFactory = ImagesJSONStringFactory()
                
                context("when input json is valid") {
                    let jsonString = imagesJSONStringFactory.make(with: .valid)
                    let json = JSON(parseJSON: jsonString)
                    
                    it("should initialize with success") {
                        expect { try APIConfigurationNetworkModel.Images(json: json) }.toNot(throwError())
                    }
                }
            }
        }
    }
}

private final class ImagesJSONStringFactory {
    enum Scenario {
        case valid
        case missingKeySecureBaseUrl
        case missingKeyBackDropSizes
        case missingAllKeys
    }
    
    func make(with scenario: Scenario) -> String {
        switch scenario {
        case .valid: return valid
            case .missingKeySecureBaseUrl: return missingKeySecureBaseUrl
            case .missingKeyBackDropSizes: return missingKeyBackDropSizes
            case .missingAllKeys: return missingAllKeys
            
        }
    }
    
    private var valid: String {
        return  """
                    {
                        "secure_base_url": "https://image.tmdb.org/t/p/",
                        "backdrop_sizes": [
                            "w300",
                            "w780",
                            "w1280",
                            "original"
                        ]
                    }
            """
    }
    
    private var missingKeySecureBaseUrl: String {
        return  """
            {
                "backdrop_sizes": [
                    "w300",
                    "w780",
                    "w1280",
                    "original"
                ]
            }
        """
    }
    
    private var missingKeyBackDropSizes: String {
        return  """
            {
                "secure_base_url": "https://image.tmdb.org/t/p/",
            }
        """
    }
    
    private var missingAllKeys: String {
        return  """
            {
        
            }
        """
    }
}
