import UIKit
import WebKit

class TMVDBLoginViewController: UIViewController, WKNavigationDelegate {
	private let viewModel: LoginWebViewModel
	
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
		
		
		wkWebView.load(URLRequest(url: viewModel.url))
		//wkWebView.loadHTMLString("https://www.google.com/", baseURL: nil)
		view = wkWebView
		
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
