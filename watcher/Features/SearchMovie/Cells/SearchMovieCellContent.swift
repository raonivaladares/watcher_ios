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
		
		movieYear = "(\(dateFormatter.string(from: movie.releaseDate)))"
        if let fullPath = movie.backdropPath {
            movieCoverPath = "https://image.tmdb.org/t/p/w500/\(fullPath)"
        } else {
            movieCoverPath = nil
        }
	}
}
