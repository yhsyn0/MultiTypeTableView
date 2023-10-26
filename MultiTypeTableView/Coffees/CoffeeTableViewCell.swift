import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "coffeeTableViewCell"
    
    var collectionView: UICollectionView!
    var coffees: [Coffee] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 25 // Add a space of 25 points between items
        layout.minimumLineSpacing = 25
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoffeeCell.self, forCellWithReuseIdentifier: CoffeeCell.reuseIdentifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        
        contentView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CoffeeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeCell.reuseIdentifier, for: indexPath) as! CoffeeCell
        cell.configure(with: coffees[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView:
                        UICollectionView,
                        layout collectionViewLayout:
                            UICollectionViewLayout,
                        sizeForItemAt indexPath:
                            IndexPath) -> CGSize {
        
         return CGSize(width:
                        80,
                       height:self.frame.height)
     }
}
