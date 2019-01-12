import NetworkPlataform
import DataPlataform

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
