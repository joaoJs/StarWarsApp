import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView?
    
    var people: [Person] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    var hwDict: [String: UIImage] = [:]
    
    //var defSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
    
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callNetwork()
        
        self.setUp()
    }
    
    private func setUp() {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseId)
        tableView.backgroundColor = UIColor(red: CGFloat(240.0/255.0), green: CGFloat(240.0/255.0), blue: CGFloat(250.0/255.0), alpha: 0.8)
        
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        self.tableView = tableView
        
    }
    
    func callNetwork() {
        
        if (self.page <= 3) {
            NetworkManager.shared.fetchPerson(page: self.page) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let pokes):
                    self.people.append(contentsOf: pokes.results)
                    self.page += 1
                case .failure(let error):
                    print("error fetchPoke")
                    print(error)
                }
            }
        }
        
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseId, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        
        let name = self.people[indexPath.row].name
        let hwURL = self.people[indexPath.row].homeworld
//        cell.textLabel?.text = name
        
        NetworkManager.shared.FetchHomeWorld(url: hwURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let hw):
                DispatchQueue.main.async {
                    // set extra info in here - home world
                    let eyeColor = self.people[indexPath.row].eye_color
                    let hairColor = self.people[indexPath.row].hair_color
                    cell.name?.text = name
                    cell.eyeColor?.text = eyeColor
                    cell.hairColor?.text = hairColor
                    cell.homeWorld?.text = hw.name
                }
//                self.people.append(contentsOf: )
//                self.page += 1
            case .failure(let error):
                print("error fetchPoke")
                print(error)
            }
        }
        //cell.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        // cache using dictionary
        //        if (self.imagesDict[name] != nil) {
        //            DispatchQueue.main.async {
        //                cell.textLabel?.text = name
        //                cell.imageView?.image = self.imagesDict[name]
        //            }
        //        } else {
        //        NetworkManager.shared.fetchForm(name: name) { [weak self] result in
        //            guard let self = self else { return }
        //            switch result {
        //            case .success(let sprite):
        //                let spriteUrl = sprite["front_default"]
        //                NetworkManager.shared.fetchSprite(name: name, spriteUrl: spriteUrl ?? self.defSprite) { [weak self] result in
        //                    guard let self = self else { return }
        //                    switch result {
        //                    case .success(let img):
        //                        DispatchQueue.main.async {
        //                            cell.textLabel?.text = name
        //                            //self.imagesDict[name] = img
        //                            cell.imageView?.image = img
        //                        }
        //                    case .failure(let error):
        //                        print("error fetchImg")
        //                        print(error)
        //                    }
        //                }
        //            case .failure(let error):
        //                print("error fetchForm")
        //                print(error)
        //            }
        //        }
        //}
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // let moves: [Move] = pokash[name]?.moves ?? [Move]()
        let name = self.people[indexPath.row].name
        
        

        DispatchQueue.main.async {
//            let rowImg: UIImage? = self.pokash[name]?.sprite
//var rowImg: UIImage?
//            if let data = self.cache.get(name: name) {
//                print("Image From Cache")
//                rowImg = UIImage(data: data)
//            }
//            let types = self.pokash[name]?.types
//            let typeOne: String?
//            let typeTwo: String?
//
//            if types?.count ?? [Type]().count > 1 {
//                typeOne = types?[0].type.name
//                typeTwo = types?[1].type.name
//
//            } else {
//                typeOne = types?[0].type.name
//                typeTwo = ""
//
//            }
//
//            if (rowImg == nil) {
//                rowImg = UIImage(named: "graph")
//            }

//            let vc = DetailViewController(details: (imageView: rowImg, name: name, typeOne: typeOne, typeTwo: typeTwo, moves: moves))
//            let name = self.pokes[indexPath.row].name
            let vc = DetailViewController(nameFromCell: name)
            self.navigationController?.pushViewController(vc, animated: false)
        }

    }

}

extension MainViewController: UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastCellIndexPath = IndexPath(row: self.people.count - 1, section: 0)
        guard indexPaths.contains(lastCellIndexPath) else { return }
        self.callNetwork()
    }

}
