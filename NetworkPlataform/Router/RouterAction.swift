import Foundation
import Alamofire

struct RouterAction {
	enum userValidation: RouterProtocol {
		case requestToken

		var path: String {
			switch self {
			case .requestToken:
				return "3/authentication/token/new"
			}
		}

		var method: HTTPMethod {
			switch self {
			default:
				return .get
			}
		}

		var encoding: ParameterEncoding {
			switch self {
			default:
				return URLEncoding(destination: .queryString)
			}
		}
	}
}
