import Foundation

class InitialVM {
    
    private let service = RegionService()
    
    
    //MARK: - Methods

    
    func getAllStates(completion: @escaping (([State]) -> Void)) {
        service.getAll {(response) in
            switch response {
            case .failure(let error):
                print("Failed to fetch States: ", error)
            case .success(let States):
                completion(States)
            }
        }
    }
}

