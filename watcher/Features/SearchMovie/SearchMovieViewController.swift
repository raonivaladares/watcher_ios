import UIKit
import SnapKit

class SearchMovieViewController: UIViewController {
	
	// MARK: Private UI properties
   
	private let tableView: UITableView = {
		let tableView = UITableView()
		tableView.backgroundColor = .clear
		tableView.estimatedRowHeight = 140
        tableView.sectionHeaderHeight = 220
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
		
		view.backgroundColor = UIColor.AppColors.yellow
		
		addViews()
		defineAndActivateConstraints()
        configureUIElements()
		registerCells()
		
		tableView.dataSource = self
		tableView.delegate = self
        
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapRecognizer)
	}
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
	
	private func registerCells() {
		tableView.register(SearchMovieResultCell.self, forCellReuseIdentifier: "SearchMovieResultCell")
        tableView.register(SearchMoviewHeaderCell.self, forHeaderFooterViewReuseIdentifier: "SearchMoviewHeaderCell")
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRolls
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieResultCell", for: indexPath) as! SearchMovieResultCell
		
		let content = viewModel.cellContent(forIndex: indexPath.row)
		cell.configure(withContent: content)
        
		return cell
	}
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SearchMoviewHeaderCell") as! SearchMoviewHeaderCell
        header.textFieldEditingDidChangeHandler = { [weak self] text in
            self?.textFieldDidEndEditing(text: text)
        }
        return header
    }
}

extension SearchMovieViewController {
    func textFieldDidEndEditing(text: String?) {
        
        if let text = text,
            !text.isEmpty {
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            perform(#selector(search), with: text, afterDelay: 2)
        }
    }
    
    
}

// MARK: UITableViewDelegate

extension SearchMovieViewController: UITableViewDelegate {}

// MARK: - Private methods - UI

extension SearchMovieViewController {
    private func configureUIElements() {
        
    }
    
	private func addViews() {
		view.addSubview(tableView)
	}
	
	private func defineAndActivateConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
	}
}
