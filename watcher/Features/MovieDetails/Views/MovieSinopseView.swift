import UIKit

final class MovieSinopseView: UIView {
    private let sinopseLabel: UILabel = {
        let label = UILabel()
        label.text = """
            adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;
        
            adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;
        
            adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;adsaskdhl alasdj l;ajd jsl; sjdla; jdlj dskljd ;
        """
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods - UI

extension MovieSinopseView {
    private func addViewProperties() {
        addSubview(sinopseLabel)
    }
    
    private func defineAndActivateConstraints() {
        sinopseLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
