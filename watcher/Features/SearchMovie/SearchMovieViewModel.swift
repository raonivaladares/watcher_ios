import Foundation
import Domain

final class SearchMovieViewModel {
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
            switch result {
            case .success(let movieSearchResult):
                self.cellContents = movieSearchResult.results.map(SearchMovieCellContent.init)
                self.movieSearchResult = movieSearchResult
                completion(.success(()))
            case .failure(let error):
                completion(.failure(ViewModelError(error: error))) //TODO:FIX
            }
        }
	}
	
	init() {
		
	}	
}
