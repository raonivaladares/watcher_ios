import UIKit

class SearchMovieResultCell: UITableViewCell {
	
	// MARK: Private UI properties
	
	private let coverImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .red
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		return imageView
	}()
	
	private let labelName: UILabel = {
		let label = UILabel()
		label.text = "AAA"
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addViews()
		defineAndActivateConstraints()
		selectionStyle = .none
		backgroundColor = .clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private methods - UI

extension SearchMovieResultCell {
	private func addViews() {
		contentView.addSubview(coverImageView)
//		contentView.addSubview(labelName)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
			coverImageView.widthAnchor.constraint(equalToConstant: 20),
			coverImageView.heightAnchor.constraint(equalToConstant: 20),
			coverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			])
	}
}
