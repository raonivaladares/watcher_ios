import Foundation

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
