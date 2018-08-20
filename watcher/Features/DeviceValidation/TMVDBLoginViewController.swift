import UIKit
import WebKit

class TMVDBLoginViewController: UIViewController, WKNavigationDelegate {
	private let viewModel: LoginWebViewModel
//	private let wkToolBar: UIToolbar = {
//		let toolBar = UIToolbar()
//		toolBar.translatesAutoresizingMaskIntoConstraints = false
//
//		return toolBar
//	}()
	private let doneButton: UIBarButtonItem = {
		let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(buttonDoneHandler))
		
		return button
	}()
	
	@objc func buttonDoneHandler() {
		navigationController?.popViewController(animated: true)
	}
	
	init(viewModel: LoginWebViewModel) {
		self.viewModel = viewModel
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		let wkWebView = WKWebView()
		wkWebView.navigationDelegate = self
		
		navigationItem.leftBarButtonItem = doneButton
		wkWebView.load(URLRequest(url: viewModel.url))
		//wkWebView.loadHTMLString("https://www.google.com/", baseURL: nil)
		view = wkWebView
		
		
//		view.addSubview(wkToolBar)
		
//		NSLayoutConstraint.activate([
//			wkToolBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//			wkToolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//			wkToolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//			wkToolBar.heightAnchor.constraint(equalToConstant: 40)
//		])
	}
}

struct LoginWebViewModel {
	private let requestToken: String
	
	var url: URL {
		return URL(string:"https://www.themoviedb.org/authenticate/\(requestToken)")!
	}
	
	init(requestToken: String) {
		self.requestToken = requestToken
	}
}
