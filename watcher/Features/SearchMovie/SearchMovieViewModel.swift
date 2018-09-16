import Foundation
import Result
import Domain

class SearchMovieViewModel {
	var numberOfSections: Int {
		return 1
	}
	
	var numberOfRolls: Int {
		return cellContents.count
	}
	
	var movieSearchResult: MovieSearchResult?
	var cellContents: [SearchMovieCellContent] = []
	let useCases: SearchContentUseCases = SearchContentUseCasesImp()
	
	func cellContent(forIndex index: Int) -> SearchMovieCellContent {
		return cellContents[index]
	}
	
	func search(movieName: String, completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		useCases.searchForMovie(queryString: movieName) { result in
			if let movieSearchResult = result.value {
				self.cellContents = movieSearchResult.results.map(SearchMovieCellContent.init)
				self.movieSearchResult = movieSearchResult
				completion(.success(()))
			} else {
				completion(.failure(ViewModelError(title: "erro", message: "a mockerd one")))
				
			}
		
		}
	}
	
	init() {
		
	}	
}
