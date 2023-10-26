import UIKit

class MostPopularCell: UICollectionViewCell {
    
    static let reuseIdentifier = "mostPopularCell"
    
    var mostPopularView: UIImageView!
    var mostPopularLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mostPopularView = UIImageView()
        mostPopularView.translatesAutoresizingMaskIntoConstraints = false
        mostPopularView.layer.cornerRadius = 3
        mostPopularView.clipsToBounds = true
        contentView.addSubview(mostPopularView)
        
        mostPopularLabel = UILabel()
        mostPopularLabel.translatesAutoresizingMaskIntoConstraints = false
        mostPopularLabel.textAlignment = .left
        mostPopularLabel.font = UIFont.boldSystemFont(ofSize: 15)
        contentView.addSubview(mostPopularLabel)
        
        NSLayoutConstraint.activate([
            mostPopularView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mostPopularView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mostPopularView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mostPopularView.heightAnchor.constraint(equalToConstant: 135),
            
            mostPopularLabel.topAnchor.constraint(equalTo: mostPopularView.bottomAnchor, constant: 10),
            mostPopularLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mostPopularLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mostPopularLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        

        mostPopularLabel.textColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with mostPopular: MostPopular) {
        mostPopularLabel.text = mostPopular.name
        mostPopularView.image = UIImage(named: mostPopular.image)
    }
}
