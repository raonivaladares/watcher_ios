import Foundation
import Domain

struct SearchMovieViewModel {
	var numberOfSections: Int {
		return 1
	}
	
	var numberOfRolls: Int {
		return cellContents.count
	}
	
	let movies: [Movie] = [Movie(serverID: 0, title: "mock 1", backdropPath: nil),
												 Movie(serverID: 1, title: "mock 2", backdropPath: nil),
												 Movie(serverID: 2, title: "mock 3", backdropPath: nil)]
	
	let cellContents: [SearchMovieCellContent]
	
	func cellContent(forIndex index: Int) -> SearchMovieCellContent {
		return cellContents[index]
	}
	
	init() {
		cellContents = movies.map(SearchMovieCellContent.init)
	}
	
}

struct SearchMovieCellContent {
	let movieTitle: String
	let movieYear: String
	let movieCoverPath: String?
	
	init(movie: Movie) {
		movieTitle = movie.title
		movieYear = movie.serverID.description
		movieCoverPath = movie.backdropPath
	}
}
