import UIKit

class ViewController: UIViewController {
   
    var tableView: UITableView!
    var coffees: [Coffee] = []
    var coffeeShops: [CoffeeShop] = []
    var mostPopulars: [MostPopular] = []
    var recentItems: [RecentItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup tableView
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.register(CoffeeTableViewCell.self, forCellReuseIdentifier: CoffeeTableViewCell.reuseIdentifier)
        tableView.register(CoffeeShopsTableViewCell.self, forCellReuseIdentifier: CoffeeShopsTableViewCell.reuseIdentifier)
        tableView.register(MostPopularTableViewCell.self, forCellReuseIdentifier: MostPopularTableViewCell.reuseIdentifier)
        tableView.register(RecentItemsTableViewCell.self, forCellReuseIdentifier: RecentItemsTableViewCell.reuseIdentifier)


        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           tableView.topAnchor.constraint(equalTo: view.topAnchor),
           tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
       
        setupCoffees()
        setupCoffeeShops()
        setupMostPopulars()
        setupRecentItems()
   }
    
    func setupRecentItems() {
        let recent1 = RecentItem(name: "Turkish Coffee", image: "turkish")
        let recent2 = RecentItem(name: "Warm Caffee", image: "shop2")
        let recent3 = RecentItem(name: "Cozy Cup Concoctions", image: "popular1")
        
        recentItems.append(contentsOf: [recent1, recent2, recent3])
    }
    
    func setupMostPopulars() {
        let popular1 = MostPopular(name: "  Cozy Cup Concoctions", image: "popular1")
        let popular2 = MostPopular(name: "  The Roasted Beanery", image: "popular2")
        let popular3 = MostPopular(name: "  Espresso Rockin' Retreat", image: "popular3")
        
        mostPopulars.append(contentsOf: [popular1, popular2, popular3])
    }
    
    func setupCoffeeShops() {
        let shop1 = CoffeeShop(name: "  Caffee de Latte", image: "shop1")
        let shop2 = CoffeeShop(name: "  Warm Caffee", image: "shop2")
        let shop3 = CoffeeShop(name: "  Wassup Macchiato", image: "shop3")
        
        coffeeShops.append(contentsOf: [shop1, shop2, shop3])
    }
   
    func setupCoffees() {
       let americano = Coffee(name: "Americano", image: "americano")
       let cappucino = Coffee(name: "Cappucino", image: "cappucino")
       let espresso = Coffee(name: "Espresso", image: "espresso")
       let hotChocolate = Coffee(name: "Hot Chocolate", image: "hotChocolate")
       let latte = Coffee(name: "Latte", image: "latte")
       let macchiato = Coffee(name: "Macchiato", image: "macchiato")
       let turkish = Coffee(name: "Turkish Coffee", image: "turkish")

       coffees.append(contentsOf: [americano, cappucino, espresso, hotChocolate, latte, macchiato, turkish])
   }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + coffeeShops.count + 1 + recentItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeTableViewCell.reuseIdentifier, for: indexPath) as! CoffeeTableViewCell
            cell.coffees = coffees
            
            return cell
        }
        
        else if indexPath.row >= 1 && indexPath.row <= coffeeShops.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeShopsTableViewCell.reuseIdentifier, for: indexPath) as! CoffeeShopsTableViewCell
            cell.configure(with: coffeeShops[indexPath.row-1])
            
            return cell
        }
        
        else if indexPath.row == (1 + coffeeShops.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: MostPopularTableViewCell.reuseIdentifier, for: indexPath) as! MostPopularTableViewCell
            cell.mostPopulars = mostPopulars
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentItemsTableViewCell.reuseIdentifier, for: indexPath) as! RecentItemsTableViewCell
            cell.configure(with: recentItems[indexPath.row - (1+coffeeShops.count+1)])
            
            return cell
        }
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat {
         
        if indexPath.row == 0 {
            return 150
        }
        
        else if indexPath.row >= 1 && indexPath.row <= coffeeShops.count {
            let imageRatio: CGFloat = 9 / 16
            let imageWidth = tableView.frame.width
            let imageHeight = imageWidth * imageRatio
            
            return imageHeight + 50
        }
        
        else if indexPath.row == (1 + coffeeShops.count) {
            return 175
        }
        
        return 80
     }
    
}
