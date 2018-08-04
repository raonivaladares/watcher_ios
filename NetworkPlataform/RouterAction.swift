import Foundation
import Alamofire

protocol RouterProtocol {
	var path: String { get }
	var method: HTTPMethod { get }
	var encoding: ParameterEncoding { get }
}

struct Route {
	enum userValidation: RouterProtocol {
		case requestToken

		var path: String {
			switch self {
			case .requestToken:
				return "3/movie/76341?"
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
				return JSONEncoding.default
			}
		}
	}
}
