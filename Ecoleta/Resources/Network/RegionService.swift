import Foundation

final class RegionService: NSObject {
    
    static let shared = RegionService()
    private let urlApi = URL(string: "http://127.0.0.1:8000/State/")!

    func getAll(completion: @escaping (Result<[State],Error>) -> Void){
        guard URL(string: "\(urlApi)") != nil else {
            print ("Not found url")
            return
        }
        
        URLSession.shared.dataTask(with: urlApi) { (data, response, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data else { return }

            do {
                let PlacesData = try JSONDecoder().decode([State].self, from: data)
                completion(.success(PlacesData))
            }catch  {
                completion(.failure(error))
            }
        }.resume()
    }
}
