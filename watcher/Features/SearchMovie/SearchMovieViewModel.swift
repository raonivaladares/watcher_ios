import Foundation
import Result
import Domain

struct SearchMovieViewModel {
	var numberOfSections: Int {
		return 1
	}
	
	var numberOfRolls: Int {
		return cellContents.count
	}
	
	let movies: [MovieSearchResult] = [
		MovieSearchResult(
			serverID: 0,
			title: "mock 1",
			backdropPath: "https://image.tmdb.org/t/p/w500_and_h282_face/zjOj2gnDJYFdYt6R7FtuHn7yrPr.jpg",
			releaseDate: Date()
		),
		MovieSearchResult(serverID: 1, title: "mock 2", backdropPath: nil, releaseDate: Date()),
		MovieSearchResult(serverID: 2, title: "mock 3", backdropPath: nil, releaseDate: Date()),
		MovieSearchResult(serverID: 3, title: "mock 4", backdropPath: nil, releaseDate: Date()),
		MovieSearchResult(serverID: 4, title: "mock 5", backdropPath: nil, releaseDate: Date()),
		MovieSearchResult(
			serverID: 5,
			title: "mock 6",
			backdropPath: "https://image.tmdb.org/t/p/w500_and_h282_face/zjOj2gnDJYFdYt6R7FtuHn7yrPr.jpg",
			releaseDate: Date()
		)
	]
	
	let cellContents: [SearchMovieCellContent]
	
	func cellContent(forIndex index: Int) -> SearchMovieCellContent {
		return cellContents[index]
	}
	
	func search(movie: String, completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		let useCases: SearchContentUseCases = SearchContentUseCasesImp()
		useCases.searchForMovie(queryString: movie) { result in
			
		}
//		completion(.failure(ViewModelError(title: "erro", message: "a mockerd one")))
	}
	
	init() {
		cellContents = movies.map(SearchMovieCellContent.init)
	}	
}
