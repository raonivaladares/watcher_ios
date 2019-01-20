import Foundation

protocol JSONCodable {
    func encode<T>(_ value: T) -> Data? where T: Encodable
    func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable
}
