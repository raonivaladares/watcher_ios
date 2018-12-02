import Foundation

public struct GuestSession {
	public let success: Bool
	public let expiresAt: Date
	public let id: String
	
	public init(success: Bool, expiresAt: Date, id: String) {
		self.success = success
		self.expiresAt = expiresAt
		self.id = id
	}
}


import NetworkPlataform

extension GuestSessionNetworkModel {
	func asDomain() -> GuestSession {
		return GuestSession(success: self.success, expiresAt: self.expiresAt, id: self.id)
	}
}

import DataPlataform
extension GuestSessionNetworkModel {
	func asDataPlataform() -> GuestSessionLocalDataModel {
		return GuestSessionLocalDataModel(success: self.success, expiresAt: self.expiresAt, id: self.id)
	}
}
