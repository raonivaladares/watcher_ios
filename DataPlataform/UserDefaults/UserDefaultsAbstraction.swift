import Foundation

protocol UserDefaultsAbstraction {
    func set(_ data: Data, forKey key: String)
    func removeObject(forKey key: String)
    func data(forKey key: String) -> Data?
}
