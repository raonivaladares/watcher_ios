import UIKit

class SearchMovieViewController: UIViewController {
	
	// MARK: Private UI properties
	
	private let tableView: UITableView = {
		let tableView = UITableView()
		tableView.estimatedRowHeight = 60
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		return tableView
	}()
	
	private let viewModel = SearchMovieViewModel()
	
}

// MARK: ViewController life-cycle

extension SearchMovieViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		addViews()
		defineAndActivateConstraints()
		registerCells()
		
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	private func registerCells() {
		tableView.register(SearchMovieResultCell.self, forCellReuseIdentifier: "SearchMovieResultCell")
	}
}

// MARK: ViewController life-cycle

extension SearchMovieViewController: UITableViewDataSource {
//	func numberOfSections(in tableView: UITableView) -> Int {
//		return viewModel.numberOfSections
//	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRolls
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieResultCell", for: indexPath) as! SearchMovieResultCell
		
		return cell
	}
}

// MARK: ViewController life-cycle

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

