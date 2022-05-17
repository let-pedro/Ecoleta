import Foundation



protocol InitialNavigationsDelegate: AnyObject {
    func InitialToHome(_ viewModel: InitialViewModel)
}


class InitialViewModel: InitialViewControllerDelegate {

    weak var InitialNavigation: InitialNavigationsDelegate?
    private let service: InitialService
    var stateList: [State] = []
    var citiesFromState: [City] = []
    
    
    
    init() {
        self.service = InitialService()
    }
    
    
    //MARK: - Methods
    
    func getAllStates(completion: @escaping ((Error) -> Void)) {
        service.getAll {(response) in
            switch response {
            case .failure(let error):
                print("Failed to fetch States: ", error)
            case .success(let States):
                self.stateList = States
            }
        }
    }
    
    func goToHome() {
        InitialNavigation?.InitialToHome(self)
    }
}
