import DataPlataform

extension ConfigurarionDataModel {
    func asDomain() -> APIConfiguration {
        let domainImages = images.asDomain()
        return APIConfiguration(images: domainImages)
    }
}

extension ConfigurarionDataModel.Images {
    func asDomain() -> APIConfiguration.Images {
        return APIConfiguration.Images(secureBaseURL: secureBaseURL, backDropSizes: backDropSizes)
    }
}
