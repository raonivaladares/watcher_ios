import UIKit

class LoadingViewController: UIViewController {
	private struct AssociatedKeys {
		static var overlay = "br.com.rov.teste"
	}
	
	private var backLoading: UIView? {
		get {
			return objc_getAssociatedObject(self, &AssociatedKeys.overlay) as? UIView
		}
		set {
			objc_setAssociatedObject(self, &AssociatedKeys.overlay, newValue as UIView?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
	
	public func showLoading() {
		if backLoading != nil { return }
		
		UIApplication.shared.isNetworkActivityIndicatorVisible = true
		
		backLoading = UIView()
		backLoading?.isUserInteractionEnabled = true
		backLoading?.translatesAutoresizingMaskIntoConstraints = false
		backLoading?.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
		
		let spinner = UIActivityIndicatorView(style: .whiteLarge)
		spinner.hidesWhenStopped = true
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.isUserInteractionEnabled = true
		spinner.startAnimating()
		
		backLoading?.addSubview(spinner)
		
		view.addSubview(backLoading!)
		NSLayoutConstraint.activate([
			backLoading!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backLoading!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backLoading!.topAnchor.constraint(equalTo: view.topAnchor),
			backLoading!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			spinner.centerXAnchor.constraint(equalTo: backLoading!.centerXAnchor),
			spinner.centerYAnchor.constraint(equalTo: backLoading!.centerYAnchor)
			])	}
	
	public func hideLoading() {
		UIApplication.shared.isNetworkActivityIndicatorVisible = false
		
		backLoading?.removeFromSuperview()
		backLoading = nil
	}
}
