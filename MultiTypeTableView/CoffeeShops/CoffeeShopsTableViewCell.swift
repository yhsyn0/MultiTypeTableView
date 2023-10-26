import UIKit

class CoffeeShopsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "coffeeShopsTableCell"
    
    var coffeeShopView: UIImageView!
    var coffeeShopLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        coffeeShopView = UIImageView()
        coffeeShopView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coffeeShopView)
        
        coffeeShopLabel = UILabel()
        coffeeShopLabel.translatesAutoresizingMaskIntoConstraints = false
        coffeeShopLabel.textAlignment = .left
        coffeeShopLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(coffeeShopLabel)

        NSLayoutConstraint.activate([
            coffeeShopView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coffeeShopView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coffeeShopView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coffeeShopView.heightAnchor.constraint(equalTo: coffeeShopView.widthAnchor, multiplier: 9/16),
            
            coffeeShopLabel.topAnchor.constraint(equalTo: coffeeShopView.bottomAnchor, constant: 2), 
            coffeeShopLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coffeeShopLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coffeeShopLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with coffeeShop: CoffeeShop) {
        coffeeShopLabel.text = coffeeShop.name
        coffeeShopView.image = UIImage(named: coffeeShop.image)
    }
}
