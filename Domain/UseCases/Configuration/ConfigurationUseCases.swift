import Foundation
import NetworkPlataform

public protocol APIConfigurationUseCases {
    func updateLocalConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void)
}
