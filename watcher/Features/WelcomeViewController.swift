import UIKit

class WelcomeViewController: UIViewController {
	let validationLabel: UILabel = {
		let label = UILabel()
		label.text = "We use this app you need to validate your device at:"
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = .red
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	let tmdLogoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "tmdb_logo")
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		return imageView
	}()
	
	let validationButton: UIButton = {
		let button = UIButton()
		button.setTitle("Validate", for: .normal)
		button.setTitleColor(.red, for: .normal)
		button.backgroundColor = .white
		button.layer.cornerRadius = 20
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .blue
		addViews()
		defineAndActivateConstraints()
	}
	
	private func addViews() {
		view.addSubview(validationLabel)
		view.addSubview(tmdLogoImageView)
		view.addSubview(validationButton)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
			validationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			validationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			validationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			
			tmdLogoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			tmdLogoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
			tmdLogoImageView.widthAnchor.constraint(equalToConstant: 300),
			tmdLogoImageView.heightAnchor.constraint(equalToConstant: 300),
			
			validationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
			validationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			validationButton.widthAnchor.constraint(equalToConstant: 200),
			validationButton.heightAnchor.constraint(equalToConstant: 40),
			])
	}
}
