import Foundation

public final class LocalDataProvider {
	public let userDefaultsDataProvider: UserDefaultsDataProvider
	
	init(userDefaultsDataProvider: UserDefaultsDataProvider) {
		self.userDefaultsDataProvider = userDefaultsDataProvider
	}
	
	public convenience init(userDefaultsDataProvider: UserDefaultsDataProvider? = nil) {
		self.init(userDefaultsDataProvider: userDefaultsDataProvider ?? UserDefaultsDataProviderImp())
	}
}

public protocol UserDefaultsDataProvider {
		func save<T: Codable>(_ model: T)
		func delete<T: Codable>(_ model: T)
		func query<T: Codable>() -> T?
}

final class UserDefaultsDataProviderImp: UserDefaultsDataProvider {
	func save<T: Codable>(_ model: T) {
		let encoder = JSONEncoder()
				if let encoded = try? encoder.encode(model) {
					UserDefaults.standard.set(encoded, forKey: String(describing: T.self))
				}
	}
	
	func delete<T: Codable>(_ model: T) {
		UserDefaults.standard.removeObject(forKey: String(describing: T.self))
	}
	
	func query<T: Codable>() -> T? {
		let decoder = JSONDecoder()
				if let questionData = UserDefaults.standard.data(forKey: String(describing: T.self)),
					let question = try? decoder.decode(T.self, from: questionData) {
					return question
				}
		
				return nil
	}
}
