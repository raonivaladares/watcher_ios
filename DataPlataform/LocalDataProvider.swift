import Foundation

public protocol LocalDataProvider {
    var userDefaultsDataProvider: UserDefaultsDataProvider { get }
}

public final class LocalDataProviderImp: LocalDataProvider {
	public let userDefaultsDataProvider: UserDefaultsDataProvider
	
	init(userDefaultsDataProvider: UserDefaultsDataProvider) {
		self.userDefaultsDataProvider = userDefaultsDataProvider
	}
	
	public convenience init(userDefaultsDataProvider: UserDefaultsDataProvider? = nil) {
        self.init(userDefaultsDataProvider: userDefaultsDataProvider ?? UserDefaultsDataProviderImp(userDefaults: UserDefaultsAbstractionImp(), codable: JSONCodableImp()))
	}
}
