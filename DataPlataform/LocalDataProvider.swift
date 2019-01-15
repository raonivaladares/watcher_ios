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
		func delete<T: Codable>(_ model: T)
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
	
	func delete<T: Codable>(_ model: T) {
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

protocol JSONCodable {
    func encode<T>(_ value: T) -> Data? where T: Encodable
    func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable
}

final class JSONCodableImp: JSONCodable {
    func encode<T>(_ value: T) -> Data? where T: Encodable {
        let encoder = JSONEncoder()
        return try? encoder.encode(value)
    }
    
    func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }
    
    
}

protocol UserDefaultsAbstraction {
    func set(_ data: Data, forKey key: String)
    func removeObject(forKey key: String)
    func data(forKey key: String) -> Data?
}

final class UserDefaultsAbstractionImp: UserDefaultsAbstraction {
    func set(_ data: Data, forKey key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func removeObject(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func data(forKey key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
}

//fun <T> id(x: T): T = x
//fun <T> compose(f1: (T) -> T, f2: (T) -> T): (T) -> T = { x: T -> f2(f1(x)) }
//
//fun main() {
//    val f = compose<Int>({ a -> a + 1 }, { b -> b * 2 })
//    println(f(3))
//    println(f == id(f))
//}
