import Foundation

struct LocalDataProvider {
	private let persistedDataProvider: PersistedDataProvider = PersistedDataProviderImp()
}


extension LocalDataProvider {
	public func persistData() {
	
	}
}

struct CachedDataProvider {}

public protocol PersistedDataProvider {
		func save<T: Codable>(_ model: T)
		func delete<T: Codable>(_ model: T)
		func current<T: Codable>() -> T?
}

struct PersistedDataProviderImp: PersistedDataProvider {
	func save<T: Codable>(_ model: T) {
		let encoder = JSONEncoder()
				if let encoded = try? encoder.encode(model) {
					UserDefaults.standard.set(encoded, forKey: String(describing: T.self))
				}
	}
	
	func delete<T: Codable>(_ model: T) {
		UserDefaults.standard.removeObject(forKey: String(describing: T.self))
	}
	
	func current<T: Codable>() -> T? {
		let decoder = JSONDecoder()
				if let questionData = UserDefaults.standard.data(forKey: String(describing: T.self)),
					let question = try? decoder.decode(T.self, from: questionData) {
					return question
				}
		
				return nil
	}
}


//protocol StandardUserDefaultsDataProvidable {
//	func save<T: Codable>(_ model: T)
//	func current<T: Codable>() -> T?
//}
//
//struct StandardUserDefaultsDataProvider: StandardUserDefaultsDataProvidable {
//	let userDefaults = UserDefaults.standard
//
//	func save<T: Codable>(_ model: T) {
//		let encoder = JSONEncoder()
//		if let encoded = try? encoder.encode(model) {
//			UserDefaults.standard.set(encoded, forKey: String(describing: T.self))
//		}
//	}
//
//	func current<T: Codable>() -> T? {
//		let decoder = JSONDecoder()
//		if let questionData = UserDefaults.standard.data(forKey: String(describing: T.self)),
//			let question = try? decoder.decode(T.self, from: questionData) {
//			return question
//		}
//
//		return nil
//	}
//}
