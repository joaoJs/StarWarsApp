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
    
    var peopleCache: [String: [String]] = [:]
    var hwDict: [String: String] = [:]
    var filmsDict: [String: [String]] = [:]
    
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
                case .success(let people):
                    self.people.append(contentsOf: people.results)
                    self.page += 1
                case .failure(let error):
                    print("error fetchPerson")
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
        let moviesUrl = self.people[indexPath.row].films
        
        
        if (filmsDict[name] != nil) {
            let eyeColor = self.peopleCache[name]?[0]
            let hairColor = self.peopleCache[name]?[1]
            cell.name?.text = name
            cell.eyeColor?.text = eyeColor
            cell.hairColor?.text = hairColor
            cell.homeWorld?.text = self.hwDict[name]
            print("has movies")
        } else {
            
            
            NetworkManager.shared.FetchHomeWorld(url: hwURL) {  result in
                
                switch result {
                case .success(let hw):
                    DispatchQueue.main.async {
                        self.hwDict[name] = hw.name
                        
                        let eyeColor = self.people[indexPath.row].eye_color
                        let hairColor = self.people[indexPath.row].hair_color
                        self.peopleCache[name] = [eyeColor, hairColor]
                        cell.name?.text = name
                        cell.eyeColor?.text = eyeColor
                        cell.hairColor?.text = hairColor
                        cell.homeWorld?.text = hw.name
                        
                    }
                    
                case .failure(let error):
                    print("error fetchWorld")
                    print(error)
                }
            }
            
            moviesUrl.forEach{ movieUrl in
                NetworkManager.shared.fetchMovies(url: movieUrl) {  result in
                    //guard let self = self else { return }
                    switch result {
                    case .success(let film):
                        DispatchQueue.main.async {
                            self.filmsDict[name]?.append(film.title)
                        }
                    case .failure(let error):
                        print("error fetchMovie")
                        print(error)
                    }
                }
            }
            
        }
        
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        DispatchQueue.main.async {
            let name = self.people[indexPath.row].name
            let hairColor = self.people[indexPath.row].hair_color
            let eyeColor = self.people[indexPath.row].eye_color
            guard let hw = self.hwDict[name] else { return }
            let movies = self.filmsDict[name] ?? ["movie1","movie2","movie3","movie4","movie5"]
            let vc = DetailViewController(details: (name: name, eyeColor: eyeColor, hairColor: hairColor, homeWorld: hw, films: movies))
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
