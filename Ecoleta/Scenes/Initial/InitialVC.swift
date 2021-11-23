import UIKit

class InitialVC: UIViewController {
    
    private var initialView: InitialView
    private let viewModel: InitialVM
    private var city: City?
    
    var stateList: [State] = []
    var citiesFromState: [City] = []
    
    //MARK: - Setup
    
    init() {
        self.viewModel = InitialVM()
        self.initialView = InitialView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        viewModel.getAllStates() { success in
            guard success != nil else {
                print("Erro ao buscar estados")
                return
            }
            self.stateList = success
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
            let homeScene = HomeVC(City: city!)
            homeScene.modalPresentationStyle = .fullScreen
            present(homeScene,animated: true)
            return
        }
        
        self.present(Utilities.Alert(Title: "Selecionar Cidade", messageAlert: "É precisor seleciona uma cidade para contínua"), animated: true)
    }
}
    // MARK: -  Extensions

extension InitialVC: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        switch pickerView.tag {
        case initialView.pickerViewStates.tag:
            return stateList.count
        
        case initialView.pickerViewCity.tag:
            return citiesFromState.count
        default:
            return initialView.pickerViewStates.tag
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        switch pickerView.tag  {
        case initialView.pickerViewStates.tag:
            return stateList[row].nameState
        
        case initialView.pickerViewCity.tag:
            return citiesFromState[row].nameCity
        default:
            return "Date not found"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag  {
        case initialView.pickerViewStates.tag:
            initialView.selectStateField.text = stateList[row].nameState
            initialView.selectStateField.resignFirstResponder()
            self.citiesFromState = stateList[row].cities
            view.endEditing(true)
        
        case initialView.pickerViewCity.tag:
            let selectedCity = citiesFromState[row]
            initialView.selectCityField.text = selectedCity.nameCity
            initialView.selectCityField.resignFirstResponder()
            city = selectedCity
            view.endEditing(true)
        default:
            return
        }
    }
}

        
