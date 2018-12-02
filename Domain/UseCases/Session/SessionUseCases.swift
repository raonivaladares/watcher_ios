import Foundation
import Result

public protocol SessionUseCases {
	func requestGuestSession(completion: @escaping (Result<Void, DomainError>) -> Void)
	func isCurrentGuestSessionValid() -> Bool
}
