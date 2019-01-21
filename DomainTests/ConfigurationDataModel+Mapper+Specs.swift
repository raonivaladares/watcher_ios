import Quick
import Nimble
import DataPlataform

@testable import Domain

final class ConfigurationDataModelMapperSpecs: QuickSpec {
    override func spec() {
        describe("ConfigurarionDataModel mapper") {
            describe("asDomain") {
                let imagesDataModel = ConfigurarionDataModel.Images(secureBaseURL: "testUrl", backDropSizes: ["sizeTest1", "sizeTest2", "sizeTest3"])
                let apiConfigurarionDataModel = ConfigurarionDataModel(images: imagesDataModel)
                let apiConfiguration = apiConfigurarionDataModel.asDomain()
                
                it("returns same secureBaseURL") {
                    expect(apiConfiguration.images.secureBaseURL) == imagesDataModel.secureBaseURL
                }
                
                it("returns same backDropSizes count") {
                    expect(apiConfiguration.images.backDropSizes.count) == imagesDataModel.backDropSizes.count
                }
                
                it("returns same backDropSizes content") {
                    expect(apiConfiguration.images.backDropSizes[0]) == imagesDataModel.backDropSizes[0]
                    expect(apiConfiguration.images.backDropSizes[1]) == imagesDataModel.backDropSizes[1]
                    expect(apiConfiguration.images.backDropSizes[2]) == imagesDataModel.backDropSizes[2]
                }
            } // asDomain
        }
    }
}
