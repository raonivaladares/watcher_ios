import Foundation

struct APIProviderConfiguration: APIConfiguration {
	var apiKey: String = PrivateKeys.tmdbAPIKey
	let apiBaseURL = URL(string: "https://api.themoviedb.org")!
}

protocol APIConfiguration {
	var apiKey: String { get }
	var apiBaseURL: URL { get }
}
