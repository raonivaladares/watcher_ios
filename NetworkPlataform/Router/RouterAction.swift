import Foundation
import Alamofire

struct RouterAction {
	enum userValidation: RouterProtocol {
		case requestToken
		case requestGuestSession
		
		var path: String {
			switch self {
			case .requestToken: return "3/authentication/token/new"
			case .requestGuestSession: return "3/authentication/guest_session/new"
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
	
	enum searchContent: RouterProtocol {
		case searchMovie
		
		var path: String {
			switch self {
			case .searchMovie: return "/search/movie"
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
