import UIKit

class InitialView: UIView {
    
    private lazy var bigLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "home-background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var logo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo-1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var subLogoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Seu marketplace de coleta de resíduos."
        label.textColor = UIColor(red: 0.196, green: 0.129, blue: 0.325, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Ajudamos pessoas a encontrarem pontos de coleta de forma eficiente."
        label.textColor = UIColor(red: 0.422, green: 0.422, blue: 0.5, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var selectStateField : UITextField = {
        let Field = UITextField(frame: .zero)
        Field.layer.cornerRadius = 8
        Field.placeholder = "Selecione a estado"
        Field.textAlignment = .center
        Field.layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        Field.translatesAutoresizingMaskIntoConstraints = false
        return Field
    }()
    
    lazy var selectCityField : UITextField = {
        let Field = UITextField(frame: .zero)
        Field.layer.cornerRadius = 8
        Field.placeholder = "Selecione a cidade"
        Field.textAlignment = .center
        Field.layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        Field.translatesAutoresizingMaskIntoConstraints = false
        return Field
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Entrar", for: .normal)
        button.layer.backgroundColor =
            UIColor(red: 0.202, green: 0.796, blue: 0.475, alpha: 1.0).cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var pickerViewStates: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.tag = 1
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    lazy var pickerViewCity: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.tag = 2
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
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

extension InitialView {
    
    private func addSubviews(){
        addSubview(bigLogo)
        addSubview(logo)
        addSubview(subLogoLabel)
        addSubview(textLabel)
        addSubview(selectStateField)
        addSubview(selectCityField)
        addSubview(enterButton)
        
        setupLayout()
    }

    private func setupLayout(){
  
        NSLayoutConstraint.activate([
            bigLogo.topAnchor.constraint(equalTo: topAnchor),
            bigLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            logo.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logo.widthAnchor.constraint(equalToConstant: 132),
            logo.heightAnchor.constraint(equalToConstant: 32),
            
            subLogoLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 80),
            subLogoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            subLogoLabel.widthAnchor.constraint(equalToConstant: 239),
            
            textLabel.topAnchor.constraint(equalTo: subLogoLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            textLabel.widthAnchor.constraint(equalToConstant: 248),
            
            selectStateField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            selectStateField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            selectStateField.heightAnchor.constraint(equalToConstant: 56),
            selectStateField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -184),
            
            selectCityField.topAnchor.constraint(equalTo: selectStateField.bottomAnchor, constant: 8),
            selectCityField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            selectCityField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            selectCityField.heightAnchor.constraint(equalToConstant: 56),
                
            enterButton.topAnchor.constraint(equalTo: selectCityField.bottomAnchor, constant: 24),
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            enterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            enterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func root(){
        layer.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.961, alpha: 1.0).cgColor
    }
}

