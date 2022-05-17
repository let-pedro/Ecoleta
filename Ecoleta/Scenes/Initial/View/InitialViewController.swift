import UIKit


protocol InitialViewControllerDelegate {
    func getAllStates(completion: @escaping ((Error) -> Void))
    func goToHome()
    var stateList: [State] { get }
    var citiesFromState: [City] { get  set}
}


class InitialViewController: UIViewController {
    
    private var initialView: InitialView
    private var city: City?
    private var delegate: InitialViewControllerDelegate
    
    
    
    //MARK: - Setup
    
    init(view: InitialView) {
        super.init(nibName: nil, bundle: nil)
        self.initialView = view
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func loadView() {
        super.loadView()
        view = initialView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsMain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        delegate.getAllStates { success in
            guard success != nil else { return }
            self.present(Utilities.Alert(Title: "Erro", messageAlert: "Ocorreu um erro de nossa parte tente novamente mais tarde"), animated: true)
        }
    }
    
    private func settingsMain(){
        buttonCall()
        showStatesAndCity()
        settingsExtension()
    }
    
    // MARK: - Main
    
    
    private func showStatesAndCity(){
        initialView.selectStateField.inputView = initialView.pickerViewStates
        initialView.selectCityField.inputView = initialView.pickerViewCity
    }
    
    private func settingsExtension(){
        initialView.pickerViewStates.delegate = self
        initialView.pickerViewStates.dataSource = self
        
        initialView.pickerViewCity.delegate = self
        initialView.pickerViewCity.dataSource = self
    }

    
    // MARK: - button action
    
    private func buttonCall(){
        initialView.enterButton.addTarget(self, action: #selector(tapButtonGoToHome), for: .touchUpInside)
    }
    
    @objc func tapButtonGoToHome(){
        guard initialView.selectCityField.text == "" else {
            delegate.goToHome()
            return
        }
        
        self.present(Utilities.Alert(Title: "Selecionar Cidade", messageAlert: "É precisor seleciona uma cidade para contínua"), animated: true)
    }
}
    // MARK: -  Extensions

extension InitialViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        switch pickerView.tag {
        case initialView.pickerViewStates.tag:
            return delegate.stateList.count
        
        case initialView.pickerViewCity.tag:
            return delegate.citiesFromState.count
        default:
            return initialView.pickerViewStates.tag
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        switch pickerView.tag  {
        case initialView.pickerViewStates.tag:
            return delegate.stateList[row].nameState
        
        case initialView.pickerViewCity.tag:
            return delegate.citiesFromState[row].nameCity
        default:
            return "Date not found"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag  {
        case initialView.pickerViewStates.tag:
            initialView.selectStateField.text = delegate.stateList[row].nameState
            initialView.selectStateField.resignFirstResponder()
            delegate.citiesFromState = delegate.stateList[row].cities
            view.endEditing(true)
        
        case initialView.pickerViewCity.tag:
            let selectedCity = delegate.citiesFromState[row]
            initialView.selectCityField.text = selectedCity.nameCity
            initialView.selectCityField.resignFirstResponder()
            city = selectedCity
            view.endEditing(true)
        default:
            return
        }
    }
}

        
