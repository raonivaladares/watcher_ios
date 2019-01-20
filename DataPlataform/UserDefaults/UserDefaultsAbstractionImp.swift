import Foundation

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
