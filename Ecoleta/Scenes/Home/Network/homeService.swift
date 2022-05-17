
import Foundation


struct HomeService {

    private let urlApi = URL(string: "http://127.0.0.1:8000/CollectionPoint/")
    
    func getAll(completion: @escaping (Result<[CollectorPoint],Error>) -> Void){
        guard let url = urlApi  else {
            print ("Not found url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data else { return}
            
            do {
                let PlacesData = try JSONDecoder().decode([CollectorPoint].self, from: data)
                completion(.success(PlacesData))
            }catch  {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func post(parameters: [String: Any], completion: @escaping (Error?) -> ()){
        guard let url = urlApi  else {
            print ("Not found url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        
        do {
            let data = try! JSONSerialization.data(withJSONObject: parameters, options: .init())
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    print("error", error?.localizedDescription ?? "")
                    return
                }
                
                guard data != nil else { return }
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
    func put(parameters: [String: Any], completion: @escaping (Error) -> Void) {
        let updateURL = URL(string: "\(urlApi)\(String(describing: parameters["id"]!))/")
        
        guard  let url = updateURL  else {
            print ("not found url")
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .init())
            
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    print("error", error?.localizedDescription)
                    return
                }
            }.resume()
                
        } catch {
            completion(error)
        }
    }
    
    
    func delete(id: Int, completion: @escaping (Error) -> Void){
        guard  let url = urlApi  else {
            print ("not found url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
       
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("error", error?.localizedDescription)
                    return
                }
                    
                if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                    let errorString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                    completion(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                    return
                }
            }
        }.resume()
    }
}
