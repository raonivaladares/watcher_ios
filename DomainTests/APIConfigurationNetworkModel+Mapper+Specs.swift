import Quick
import Nimble
import NetworkPlataform
import DataPlataform

@testable import Domain

final class APIConfigurationNetworkModelMapperSpecs: QuickSpec {
    override func spec() {
        describe("APIConfigurationNetworkModel mapper") {
            describe("asDataPlataform") {
                let imagesNetworkModel = APIConfigurationNetworkModel.Images(secureBaseURL: "testUrl", backDropSizes: ["sizeTest1", "sizeTest2", "sizeTest3"])
                let apiConfigurationNetworkModel = APIConfigurationNetworkModel(images: imagesNetworkModel)
                let apiConfigurationDataModel = apiConfigurationNetworkModel.asDataPlataform()
                
                it("returns same secureBaseURL") {
                    expect(apiConfigurationDataModel.images.secureBaseURL) == imagesNetworkModel.secureBaseURL
                }
                
                it("returns same backDropSizes count") {
                    expect(apiConfigurationDataModel.images.backDropSizes.count) == imagesNetworkModel.backDropSizes.count
                }
                
                it("returns same backDropSizes content") {
                    expect(apiConfigurationDataModel.images.backDropSizes[0]) == imagesNetworkModel.backDropSizes[0]
                    expect(apiConfigurationDataModel.images.backDropSizes[1]) == imagesNetworkModel.backDropSizes[1]
                    expect(apiConfigurationDataModel.images.backDropSizes[2]) == imagesNetworkModel.backDropSizes[2]
                }
            } // init
        }
    }
}
