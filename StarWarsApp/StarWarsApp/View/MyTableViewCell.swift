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
        

        
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4.0
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        name.textAlignment = .left
        
        let hairColor = UILabel(frame: .zero)
        hairColor.translatesAutoresizingMaskIntoConstraints = false
        hairColor.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        hairColor.textAlignment = .center
        
        let eyeColor = UILabel(frame: .zero)
        eyeColor.translatesAutoresizingMaskIntoConstraints = false
        eyeColor.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        eyeColor.textAlignment = .center
        
        let homeWorld = UILabel(frame: .zero)
        homeWorld.translatesAutoresizingMaskIntoConstraints = false
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
        
        self.name = name
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        self.homeWorld = homeWorld
    }
    
}



