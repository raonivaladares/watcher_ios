import Foundation
import Domain

struct SearchMovieCellContent {
	let movieTitle: String
	let movieYear: String
	let movieCoverPath: String?
	
	init(movie: MovieSearchResult.Result) {
		movieTitle = movie.title
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY"
		
		movieYear = dateFormatter.string(from: movie.releaseDate)
		movieCoverPath = movie.backdropPath
	}
}
