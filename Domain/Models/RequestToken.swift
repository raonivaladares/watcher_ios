import Foundation

public struct RequestToken {
	public let success: Bool
	public let expiresAt: Date
	public let token: String
	
	public init(success: Bool, expiresAt: Date, token: String) {
		self.success = success
		self.expiresAt = expiresAt
		self.token = token
	}
}
