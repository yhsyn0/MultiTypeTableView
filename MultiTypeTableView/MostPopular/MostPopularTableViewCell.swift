import UIKit

class MostPopularTableViewCell: UITableViewCell {

    
    static let reuseIdentifier = "mostPopularTableViewCell"
    
    var mostPopularCollectionView: UICollectionView!
    var mostPopulars: [MostPopular] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        mostPopularCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mostPopularCollectionView.delegate = self
        mostPopularCollectionView.dataSource = self
        mostPopularCollectionView.register(MostPopularCell.self, forCellWithReuseIdentifier: MostPopularCell.reuseIdentifier)
        
        mostPopularCollectionView.showsHorizontalScrollIndicator = false
        mostPopularCollectionView.bounces = false
        
        contentView.addSubview(mostPopularCollectionView)
        
        mostPopularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mostPopularCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mostPopularCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mostPopularCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            mostPopularCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MostPopularTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mostPopulars.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MostPopularCell.reuseIdentifier, for: indexPath) as! MostPopularCell
        cell.configure(with: mostPopulars[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 240, height:self.frame.height)
     }
    
}
