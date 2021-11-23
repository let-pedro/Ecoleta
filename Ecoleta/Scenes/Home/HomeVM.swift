import Foundation

class HomeVM {
    
    private var service: CollectorPointService
    var pointsList: [CollectorPoint] = []


    init(City: City) {
        self.service = CollectorPointService()
        getCollectionPoints(City: City)
    }
    
    
    //MARK: - Methods
    
    private func getCollectionPoints(City: City){
        service.getAll { (response) in
            switch response {
            case .failure(let error):
                print("Failed to fetch posts: ", error)
                
            case .success(let points):
                self.pointsList = points.filter{ point in
                    return point.city == City.nameCity
                }
            }
        }
    }
    
    func getSelectedPoint(_ pointName: String) -> CollectorPoint{
        var selectdPoint: CollectorPoint!
        for point in self.pointsList {
            if point.entityName == pointName {
                selectdPoint = point
            }
        }
        return selectdPoint
    }
}

