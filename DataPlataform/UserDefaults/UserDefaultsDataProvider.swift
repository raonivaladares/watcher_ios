import Foundation

public protocol UserDefaultsDataProvider {
    func save<T: Codable>(_ model: T)
    func delete<T: Codable>(_ model: T.Type)
    func query<T: Codable>() -> T?
}
