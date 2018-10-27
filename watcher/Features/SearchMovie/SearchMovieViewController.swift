import UIKit

class SearchMovieViewController: UIViewController {
	
	// MARK: Private UI properties
	
	private let tableView: UITableView = {
		let tableView = UITableView()
		tableView.backgroundColor = .clear
		tableView.estimatedRowHeight = 140
		tableView.rowHeight = UITableView.automaticDimension
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		return tableView
	}()
	
	private var viewModel = SearchMovieViewModel()
}

// MARK: ViewController life-cycle

extension SearchMovieViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .black
		
		addViews()
		defineAndActivateConstraints()
		registerCells()
		
		tableView.dataSource = self
		tableView.delegate = self
		
		title = "Search Movie"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		let searchController = UISearchController(searchResultsController: nil)
		searchController.searchResultsUpdater = self
		searchController.searchBar.barStyle = .black
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
	}
	
	private func registerCells() {
		tableView.register(SearchMovieResultCell.self, forCellReuseIdentifier: "SearchMovieResultCell")
	}
	
	@objc private func search(_ text: String) {
		viewModel.search(movieName: text) { result in
			result.analysis(ifSuccess: { _ in
				self.tableView.reloadData()
			}, ifFailure: { viewModelError in
				print(viewModelError.title)
				print(viewModelError.message)
			})
		}
	}
}

// MARK: UISearchResultsUpdating

extension SearchMovieViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		if let text = searchController.searchBar.text,
					!text.isEmpty {
			NSObject.cancelPreviousPerformRequests(withTarget: self)
			perform(#selector(search), with: text, afterDelay: 2)
		}
		
	}
}

// MARK: UITableViewDataSource

extension SearchMovieViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRolls
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieResultCell", for: indexPath) as! SearchMovieResultCell
		
		let content = viewModel.cellContent(forIndex: indexPath.row)
		cell.configure(withContent: content)
		
		return cell
	}
}

// MARK: UITableViewDelegate

extension SearchMovieViewController: UITableViewDelegate {}

// MARK: - Private methods - UI

extension SearchMovieViewController {
	private func addViews() {
		view.addSubview(tableView)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			])
	}
}
