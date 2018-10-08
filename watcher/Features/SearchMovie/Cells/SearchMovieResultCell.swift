import UIKit

class SearchMovieResultCell: UITableViewCell {
	
	// MARK: Private UI properties
	
	private let coverImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .red
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		return imageView
	}()
	
	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 5
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		return stackView
	}()
	
	private let movieNameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private let movieYearlabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	// MARK: Initialization
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addViewProperties()
		defineAndActivateConstraints()
		selectionStyle = .none
		backgroundColor = .clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(withContent content: SearchMovieCellContent) {
		movieNameLabel.text = content.movieTitle
		movieYearlabel.text = content.movieYear
		if let stringPath = content.movieCoverPath,
			 let url = URL(string: stringPath) {
				coverImageView.load(url: url)
		}
	}
}

// MARK: - Private methods - UI

extension SearchMovieResultCell {
	private func addViewProperties() {
		contentView.addSubview(coverImageView)
		contentView.addSubview(stackView)
		
		stackView.addArrangedSubview(movieNameLabel)
		stackView.addArrangedSubview(movieYearlabel)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
			coverImageView.widthAnchor.constraint(equalToConstant: 60),
			coverImageView.heightAnchor.constraint(equalToConstant: 100),
			coverImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 20),
			coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			coverImageView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -20),
			coverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			
			stackView.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
		])
	}
}
