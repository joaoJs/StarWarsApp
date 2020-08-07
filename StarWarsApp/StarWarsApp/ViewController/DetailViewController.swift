import UIKit

class DetailViewController: UIViewController {

    var name: UILabel?
    //var stackView: UIStackView?
    
    //var tuple: (/*imageView: UIImage?, name:*/ String)?
    var nameFromCell: String?
    
    init(/*details: ( imageView: UIImage?,  name: String)*/ nameFromCell: String) {
        //self.tuple = details
        self.nameFromCell = nameFromCell
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.name?.text = self.nameFromCell
    }
    
    private func setUp() {
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
        
//        let imageView = UIImageView(frame: .zero)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "Graph")
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "test"
        name.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(50.0/255.0), alpha: 0.8)
        name.font = UIFont(name: "AvenirNextCondensed-Regular", size: 32.0)
        name.textAlignment = .center
        
//        let typeOne = UILabel(frame: .zero)
//        typeOne.translatesAutoresizingMaskIntoConstraints = false
//        typeOne.textColor = Helpers.getTypeColor(type: to)
//        typeOne.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)
//        typeOne.textAlignment = .center
//
//        let typeTwo = UILabel(frame: .zero)
//        typeTwo.translatesAutoresizingMaskIntoConstraints = false
//        typeTwo.textColor = Helpers.getTypeColor(type: tt)
//        typeTwo.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)
//        typeTwo.textAlignment = .center
        
        //self.view.addSubview(imageView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(name)
//        stackView.addArrangedSubview(typeOne)
//        stackView.addArrangedSubview(typeTwo)
        //self.view.addSubview(name)
        
        
//        films.forEach{ film in
//            let currMove = UILabel(frame: .zero)
//            currMove.translatesAutoresizingMaskIntoConstraints = false
//            currMove.text = film
//            currMove.textAlignment = .center
//            stackView.addArrangedSubview(currMove)
//        }
        
//        imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 256).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 256).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -8).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
//        name.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        name.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        name.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        //stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        
        //self.imageView = imageView
        self.name = name
//        self.typeOne = typeOne
//        self.typeTwo = typeTwo
        //self.stackView = stackView
    }
}
