import UIKit

class CoffeeCell: UICollectionViewCell {
    
    static let reuseIdentifier = "coffeeCell"
    
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup imageView
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10 // Make the image view's corners rounded
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        
        // Setup label
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center // Center the text
        label.font = UIFont.boldSystemFont(ofSize: 10) // Set the font to bold and size to 16
        contentView.addSubview(label)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80), // Adjust this as needed
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10), // Add a space of 10 points
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 20) // Adjust this as needed
        ])
        
        // Make the cell's corners rounded
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        // Set the label's text color to dark gray
        label.textColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with coffee: Coffee) {
        label.text = coffee.name
        // Load the image from the app bundle
        imageView.image = UIImage(named: coffee.image)
    }
}
