import UIKit

class SearchMovieResultCell: UITableViewCell {
	
	// MARK: Private UI properties
	
	private let coverImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = UIColor.init(red: 191/255, green: 144/255, blue: 15/255, alpha: 1)
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
		label.textColor = UIColor.AppColors.black
		label.font = UIFont(name: "OpenSans-Bold", size: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private let movieYearlabel: UILabel = {
		let label = UILabel()
		label.textColor = UIColor.AppColors.black
        label.font = UIFont(name: "OpenSans", size: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	// MARK: Initialization
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
			coverImageView.widthAnchor.constraint(equalToConstant: 90),
			coverImageView.heightAnchor.constraint(equalToConstant: 110),
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
