import Domain

final class RemoteImagesSettingsManager {
    func updateSettings() {
        UseCasesFactory().configuration.updateLocalConfiguration { result in
            result.analysis(ifSuccess: { _ in
                print("success")
                
            }, ifFailure: { _ in
                print("fail")
            })
        }
    }
}
