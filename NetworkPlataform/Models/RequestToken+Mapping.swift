import Domain
import SwiftyJSON

extension RequestToken {
	init?(json: JSON) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
		
		guard
			let success = json["success"].bool,
			let expiresAtRawValue = json["expires_at"].string,
			let expiresAt = dateFormatter.date(from: expiresAtRawValue),
			let token = json["request_token"].string else {
				
				return nil
		}
		
		self.init(success: success, expiresAt: expiresAt, token: token)
	}
}
