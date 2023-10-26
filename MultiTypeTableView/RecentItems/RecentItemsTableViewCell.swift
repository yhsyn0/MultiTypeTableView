import UIKit

class RecentItemsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "recentItemsTableCell"
    
    var recentItemView: UIImageView!
    var recentItemLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        recentItemView = UIImageView()
        recentItemView.translatesAutoresizingMaskIntoConstraints = false
        recentItemView.contentMode = .scaleAspectFill
        recentItemView.clipsToBounds = true
        contentView.addSubview(recentItemView)
        
        recentItemLabel = UILabel()
        recentItemLabel.translatesAutoresizingMaskIntoConstraints = false
        recentItemLabel.textAlignment = .left
        recentItemLabel.font = UIFont.boldSystemFont(ofSize: 10)
        contentView.addSubview(recentItemLabel)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            recentItemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recentItemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 25),
            recentItemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            recentItemView.widthAnchor.constraint(equalToConstant: 80),
            
            recentItemLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            recentItemLabel.leadingAnchor.constraint(equalTo: recentItemView.trailingAnchor, constant: 10),
            recentItemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recentItemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with recentItem: RecentItem) {
        recentItemLabel.text = recentItem.name
        recentItemView.image = UIImage(named: recentItem.image)
    }
}
