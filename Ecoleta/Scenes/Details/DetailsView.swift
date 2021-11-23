import UIKit

class DetailsView: UIView {
    
    lazy var imageEstablishment: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameOfEstablishment: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(red: 0.24, green: 0.24, blue: 0.3, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeItems: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(red: 0.202, green: 0.796, blue: 0.473, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textAddress: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Endereço"
        label.textColor = UIColor(red: 0.196, green: 0.129, blue: 0.325, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var address: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(red: 0.422, green: 0.422, blue: 0.5, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var whatsappButton: UIButton = {
        let button = UIButton(type:  .system)
        button.frame = CGRect(x: 0, y: 0, width: 160, height: 51)
        button.setTitle("Whatsapp", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor =
            UIColor(red: 0.202, green: 0.796, blue: 0.475, alpha: 1.0).cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 160.0, height: 51.0)
        button.setTitle("E-mail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor =
            UIColor(red: 0.202, green: 0.796, blue: 0.475, alpha: 1.0).cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var setupButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [whatsappButton,emailButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

extension DetailsView {
    
    private func addSubviews(){
        addSubview(imageEstablishment)
        addSubview(nameOfEstablishment)
        addSubview(typeItems)
        addSubview(textAddress)
        addSubview(address)
        addSubview(setupButtonsStackView)
        
        setupLayout()
    }
    
    private func setupLayout(){
        
        NSLayoutConstraint.activate([
            imageEstablishment.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            imageEstablishment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imageEstablishment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            imageEstablishment.heightAnchor.constraint(equalToConstant: 190),
            
            nameOfEstablishment.topAnchor.constraint(equalTo: imageEstablishment.bottomAnchor, constant: 24),
            nameOfEstablishment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            typeItems.topAnchor.constraint(equalTo: nameOfEstablishment.bottomAnchor, constant: 16),
            typeItems.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            typeItems.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55),
            
            textAddress.topAnchor.constraint(equalTo: typeItems.bottomAnchor, constant: 40),
            textAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textAddress.heightAnchor.constraint(equalToConstant: 54),
            
            address.topAnchor.constraint(equalTo: textAddress.bottomAnchor, constant: 8),
            address.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            address.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -103),
            
            setupButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            setupButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            setupButtonsStackView.heightAnchor.constraint(equalToConstant: 51),
            setupButtonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
    }
    
    private func root(){
        layer.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.961, alpha: 1.0).cgColor
    }
}

