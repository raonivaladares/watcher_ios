import Foundation

public final class LocalDataProvider {
	public let userDefaultsDataProvider: UserDefaultsDataProvider
	
	init(userDefaultsDataProvider: UserDefaultsDataProvider) {
		self.userDefaultsDataProvider = userDefaultsDataProvider
	}
	
	public convenience init(userDefaultsDataProvider: UserDefaultsDataProvider? = nil) {
        self.init(userDefaultsDataProvider: userDefaultsDataProvider ?? UserDefaultsDataProviderImp(userDefaults: UserDefaultsAbstractionImp(), codable: JSONCodableImp()))
	}
}

public protocol UserDefaultsDataProvider {
		func save<T: Codable>(_ model: T)
		func delete<T: Codable>(_ model: T.Type)
		func query<T: Codable>() -> T?
}

final class UserDefaultsDataProviderImp: UserDefaultsDataProvider {
    private let userDefaults: UserDefaultsAbstraction
    private let codable: JSONCodable
    
    init(userDefaults: UserDefaultsAbstraction, codable: JSONCodable) {
        self.userDefaults = userDefaults
        self.codable = codable
    }
    
	func save<T: Codable>(_ model: T) {
        if let encoded = codable.encode(model) {
            userDefaults.set(encoded, forKey: String(describing: T.self))
        }
	}
	
	func delete<T: Codable>(_ modelType: T.Type) {
        userDefaults.removeObject(forKey: String(describing: T.self))
	}
	
	func query<T: Codable>() -> T? {
        if let questionData = userDefaults.data(forKey: String(describing: T.self)),
           let question = codable.decode(T.self, from: questionData) {
            
            return question
        }
        
        return nil
	}
}
