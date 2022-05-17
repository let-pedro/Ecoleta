import UIKit
import MapKit

class HomeView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.961, alpha: 1.0)
        button.setImage(
            UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)),
            for: .normal)
        button.tintColor = UIColor(red: 0.202, green: 0.796, blue: 0.473, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.961, alpha: 1.0)
        button.setImage(
            UIImage(systemName: "plus.rectangle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)),
            for: .normal)
        button.tintColor = UIColor(red: 0.202, green: 0.796, blue: 0.473, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "😃 Bem vindo."
        label.textColor = UIColor(red: 0.196, green: 0.129, blue: 0.325, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var texInfotLabel: UILabel = {
        let label = UILabel()
        label.text = "Encontre no mapa um ponto de coleta."
        label.textColor = UIColor(red: 0.422, green: 0.422, blue: 0.5, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 8
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    lazy var typeOfCollections: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.961, alpha: 1.0).cgColor
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubviews()
        root()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension HomeView {
    
    private func addSubviews(){
        addSubview(backButton)
        addSubview(createButton)
        addSubview(welcomeLabel)
        addSubview(texInfotLabel)
        addSubview(mapView)
        addSubview(typeOfCollections)
        
        setupLayout()

    }

    private func setupLayout(){
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 60.0),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            createButton.topAnchor.constraint(equalTo: topAnchor, constant: 60.0),
            createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            welcomeLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 32.0),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 140.0),
            
            texInfotLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4.0),
            texInfotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            texInfotLabel.widthAnchor.constraint(equalToConstant: 270.0),
            
            mapView.topAnchor.constraint(equalTo: texInfotLabel.bottomAnchor, constant: 24.0),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            mapView.bottomAnchor.constraint(equalTo: typeOfCollections.topAnchor, constant: -24.0),
 
            typeOfCollections.heightAnchor.constraint(equalToConstant: 104),
            typeOfCollections.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            typeOfCollections.trailingAnchor.constraint(equalTo: trailingAnchor),
            typeOfCollections.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
    }
    
    private func root(){
        layer.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.961, alpha: 1.0).cgColor
    }
}

