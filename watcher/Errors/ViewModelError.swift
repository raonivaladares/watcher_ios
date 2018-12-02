import Foundation
import Domain

struct ViewModelError: Error {
	let title: String
	let message: String
	
	init(error: DomainError) {
		title = "Not ready"
		message = "not ready"
	}
}
