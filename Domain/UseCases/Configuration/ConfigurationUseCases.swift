import Foundation
import Result
import NetworkPlataform

public protocol APIConfigurationUseCases {
    func requestConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void)
}
