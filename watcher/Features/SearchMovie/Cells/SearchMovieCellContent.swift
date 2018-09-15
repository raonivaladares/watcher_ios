import Foundation
import Domain

struct SearchMovieCellContent {
	let movieTitle: String
	let movieYear: String
	let movieCoverPath: String?
	
	init(movie: MovieSearchResult.Movie) {
		movieTitle = movie.title
		movieYear = movie.serverID.description
		movieCoverPath = movie.backdropPath
	}
}
