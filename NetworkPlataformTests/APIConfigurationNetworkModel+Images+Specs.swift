
import Quick
import Nimble
import SwiftyJSON

@testable import NetworkPlataform

final class APIConfigurationNetworkModelImagesSpecs: QuickSpec {
    override func spec() {
        describe("APIConfigurationNetworkModel.Images") {
            context("init") {
                let imagesJSONStringFactory = ImagesJSONStringFactory()
                
                context("when json is valid") {
                    let jsonString = imagesJSONStringFactory.make(with: .valid)
                    let json = JSON(parseJSON: jsonString)
                    
                    it("should initialize with success") {
                        expect { try APIConfigurationNetworkModel.Images(json: json) }.toNot(throwError())
                    }
                }
                
                context("when json is missing key: secure_base_url") {
                    let jsonString = imagesJSONStringFactory.make(with: .missingKeySecureBaseUrl)
                    let json = JSON(parseJSON: jsonString)
                    
                    it("should throw error: ModelError.jsonWithMissingKey") {
                        expect { try APIConfigurationNetworkModel.Images(json: json) }
                            .to(throwError { (error: ModelError) in
                                if case .jsonWithMissingKey(let key) = error {
                                    expect(key) == "secure_base_url"
                                } else {
                                    fail()
                                }
                            })
                    }
                }
                
                context("when json is missing key: backdrop_sizes") {
                    let jsonString = imagesJSONStringFactory.make(with: .missingKeyBackDropSizes)
                    let json = JSON(parseJSON: jsonString)
                    
                    it("should throw error: ModelError.jsonWithMissingKey") {
                        expect { try APIConfigurationNetworkModel.Images(json: json) }
                            .to(throwError { (error: ModelError) in
                                if case .jsonWithMissingKey(let key) = error {
                                    expect(key) == "backdrop_sizes"
                                } else {
                                    fail()
                                }
                            })
                    }
                }
                
                context("when json has invalid content for key: secure_base_url") {
                    let jsonString = imagesJSONStringFactory.make(with: .invalidContentOnSecureBaseUrl)
                    let json = JSON(parseJSON: jsonString)
                    
                    it("should throw error: ModelError.jsonWithMissingKey") {
                        expect { try APIConfigurationNetworkModel.Images(json: json) }
                            .to(throwError { (error: ModelError) in
                                if case .jsonWithInvalidInput(let key) = error {
                                    expect(key) == "secure_base_url"
                                } else {
                                    fail()
                                }
                            })
                    }
                }
                
                context("when json has invalid content for key: backdrop_sizes") {
                    let jsonString = imagesJSONStringFactory.make(with: .invalidContentOnKeyBackDropSizes)
                    let json = JSON(parseJSON: jsonString)
                    
                    it("should throw error: ModelError.jsonWithMissingKey") {
                        expect { try APIConfigurationNetworkModel.Images(json: json) }
                            .to(throwError { (error: ModelError) in
                                if case .jsonWithInvalidInput(let key) = error {
                                    expect(key) == "backdrop_sizes"
                                } else {
                                    fail()
                                }
                            })
                    }
                }
            } // init
        }
    }
}

private final class ImagesJSONStringFactory {
    enum Scenario {
        case valid
        case missingKeySecureBaseUrl
        case missingKeyBackDropSizes
        case invalidContentOnSecureBaseUrl
        case invalidContentOnKeyBackDropSizes
    }
    
    func make(with scenario: Scenario) -> String {
        switch scenario {
        case .valid: return valid
        case .missingKeySecureBaseUrl: return missingKeySecureBaseUrl
        case .missingKeyBackDropSizes: return missingKeyBackDropSizes
        case .invalidContentOnSecureBaseUrl: return invalidContentOnSecureBaseUrl
            case .invalidContentOnKeyBackDropSizes: return invalidContentOnKeyBackDropSizes
            
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
    
    private var invalidContentOnSecureBaseUrl: String {
        return  """
            {
                "secure_base_url": "",
                "backdrop_sizes": [
                    "w300",
                    "w780",
                    "w1280",
                    "original"
                ]
            }
        """
    }
    
    private var invalidContentOnKeyBackDropSizes: String {
        return  """
            {
                "secure_base_url": "https://image.tmdb.org/t/p/",
                "backdrop_sizes": [t]
            }
        """
    }
}
