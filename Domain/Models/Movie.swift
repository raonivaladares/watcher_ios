import Foundation

public struct Movie {
	public let serverID: Int
	public let title: String
	public let backdropPath: String?
	
	public init (serverID: Int, title: String, backdropPath: String?) {
		self.serverID = serverID
		self.title = title
		self.backdropPath = backdropPath
	}
}
