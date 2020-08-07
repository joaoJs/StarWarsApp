import UIKit

class DetailViewController: UIViewController {

    var name: UILabel?
    var eyeColor: UILabel?
    var hairColor: UILabel?
    var homeWorld: UILabel?
    var stackView: UIStackView?
    
    var nameFromCell: String?
    var eyeColorFromCell: String?
    var hairColorFromCell: String?
    var homeWorldFromCell: String?
    var moviesFromCell: [String]?
    
    
    var tuple: (name: String, eyeColor: String?, hairColor: String?, homeWorld: String?, films: [String]?)?
    
    init(details: (name: String, eyeColor: String?, hairColor: String?, homeWorld: String?, films: [String]?)) {
        self.tuple = details
        super.init(nibName: nil, bundle: nil)
    }
    
    init(nameFromCell: String, eyeColorFromCell: String, hairColorFromCell: String, homeWorldFromCell: String, moviesFromCell: [String]) {
        //self.tuple = details
        self.nameFromCell = nameFromCell
        self.eyeColorFromCell? = eyeColorFromCell
        self.hairColorFromCell? = hairColorFromCell
        self.homeWorldFromCell? = homeWorldFromCell
        //self.moviesFromCell? = moviesFromCell
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp(movies: self.tuple?.films ?? ["movie1", "movie2"])
        self.name?.text = self.tuple?.name
        self.eyeColor?.text = self.tuple?.eyeColor
        self.hairColor?.text = self.tuple?.hairColor
        self.homeWorld?.text = self.tuple?.homeWorld
    }
    
    private func setUp(movies: [String]) {
        self.view.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: 1.0)
        
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8.0
        stackView.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: 1.0)
        
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "test"
        name.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(50.0/255.0), alpha: 0.8)
        name.font = UIFont(name: "AvenirNextCondensed-Regular", size: 32.0)
        name.textAlignment = .center
        
        let eyeColor = UILabel(frame: .zero)
        eyeColor.translatesAutoresizingMaskIntoConstraints = false
        eyeColor.text = "test"
        eyeColor.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(50.0/255.0), alpha: 0.8)
        eyeColor.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        eyeColor.textAlignment = .center
        
        let hairColor = UILabel(frame: .zero)
        hairColor.translatesAutoresizingMaskIntoConstraints = false
        hairColor.text = "test"
        hairColor.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(50.0/255.0), alpha: 0.8)
        hairColor.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        hairColor.textAlignment = .center
        
        let homeWorld = UILabel(frame: .zero)
        homeWorld.translatesAutoresizingMaskIntoConstraints = false
        homeWorld.text = "test"
        homeWorld.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(50.0/255.0), alpha: 0.8)
        homeWorld.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        homeWorld.textAlignment = .center
        
        
        //self.view.addSubview(imageView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(eyeColor)
        stackView.addArrangedSubview(hairColor)
        stackView.addArrangedSubview(homeWorld)
        
        
        movies.forEach{ movie in
            let movieLabel = UILabel(frame: .zero)
            movieLabel.translatesAutoresizingMaskIntoConstraints = false
            movieLabel.text = movie
            movieLabel.textColor = .black
            movieLabel.textAlignment = .center
            stackView.addArrangedSubview(movieLabel)
        }
    
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -8).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        

        self.stackView = stackView
        self.name = name
        self.eyeColor = eyeColor
        self.hairColor = hairColor
        self.homeWorld = homeWorld

    }
}
