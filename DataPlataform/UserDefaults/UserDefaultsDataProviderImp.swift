import Foundation

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
