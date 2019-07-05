import Domain

final class RemoteImagesSettingsManager {
    func updateSettings() {
        UseCasesFactory().configuration.updateLocalConfiguration { result in
            switch result {
            case .success:
                print("success")
            case .failure:
                print("fail")   
            }
        }
    }
}
