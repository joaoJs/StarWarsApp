import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let reuseId: String = "MyCell"
    
    //var id: UILabel?
    var name: UILabel?
    var hairColor: UILabel?
    var eyeColor: UILabel?
    var homeWorld: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.contentView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
//        let imageView = UIImageView(frame: .zero)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4.0
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        //name.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(80.0/255.0), alpha: 0.8)
        name.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        //labelFont = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:9.0];
        name.textAlignment = .center
        
        let hairColor = UILabel(frame: .zero)
        hairColor.translatesAutoresizingMaskIntoConstraints = false
        //hairColor.textColor = .black
        hairColor.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        hairColor.textAlignment = .center
        
        let eyeColor = UILabel(frame: .zero)
        eyeColor.translatesAutoresizingMaskIntoConstraints = false
        //eyeColor.textColor = .black
        eyeColor.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        eyeColor.textAlignment = .center
        
        let homeWorld = UILabel(frame: .zero)
        homeWorld.translatesAutoresizingMaskIntoConstraints = false
        //homeWorld.textColor = .black
        homeWorld.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        homeWorld.textAlignment = .center
        
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(hairColor)
        stackView.addArrangedSubview(eyeColor)
        stackView.addArrangedSubview(homeWorld)
        
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        //stackView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        //stackView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        //imageView.ratio
        
        //self.img = imageView
        self.name = name
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        self.homeWorld = homeWorld
    }
    
}



