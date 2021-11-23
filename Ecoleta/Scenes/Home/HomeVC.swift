import UIKit
import MapKit

class HomeVC: UIViewController {
    
    private var homeView: HomeView
    private let viewModel: HomeVM
    private let selectedCity: City
    private var selectedPoint: CollectorPoint?
    
    
    //MARK: - Setup
    
    
    init(City: City) {
        self.viewModel = HomeVM(City: City)
        self.homeView = HomeView()
        self.selectedCity = City
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func loadView() {
        super.loadView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsMain()
    }
    
    private func settingsMain(){
        buttonCall()
        settingsMapView()
        settingsDelegates()
    }
    
    
    // MARK: - Main

    
    private func settingsDelegates(){
        homeView.typeOfCollections.frame =  view.bounds
        homeView.typeOfCollections.delegate = self
        homeView.typeOfCollections.dataSource = self
        
        homeView.mapView.delegate = self
    }
    
    private func settingsMapView(){
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(selectedCity.latitude ), longitude: CLLocationDegrees(selectedCity.longitude))
        homeView.mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
        
        addMapPoints()
    }
    
    private func addMapPoints(){
        for point in viewModel.pointsList {
            let pin = MKPointAnnotation()
            pin.title = point.entityName
            let locations = CLLocationCoordinate2D(latitude: CLLocationDegrees(CLLocationDegrees( point.location[0].latitude )), longitude: CLLocationDegrees( point.location[0].longitude))
            pin.coordinate = locations
            
            homeView.mapView.addAnnotation(pin)
        }
    }
    
    
    // MARK: - button action
    
    private func buttonCall(){
        homeView.backButton.addTarget(self, action: #selector(TapButtonGoToInitial), for: .touchUpInside)
        homeView.createButton.addTarget(self, action: #selector(TapButtonGoToCreate), for: .touchUpInside)
    }
    
    @objc func TapButtonGoToInitial(){
        let InitialScene = InitialVC()
        InitialScene.modalPresentationStyle = .fullScreen
        present(InitialScene, animated: true)
    }
    
    @objc func TapButtonGoToCreate(){
        //let CreateScene = CreateVC()
        //CreateScene.modalPresentationStyle = .fullScreen
        //present(CreateScene, animated: true)
    }
    
    @objc func TapButtonGoDetails(){
        let DetailScene = DetailsVC(Point: selectedPoint!)
        present(DetailScene, animated: true)
    }

}

// MARK: -  Extensions

extension HomeVC: MKMapViewDelegate {

func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard !(annotation is MKUserLocation) else { return nil }
    
    var annotationView = homeView.mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
    
    let detailsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
    detailsButton.setBackgroundImage(UIImage(named: "location"), for: UIControl.State())
    detailsButton.addTarget(self, action: #selector(TapButtonGoDetails), for: .touchUpInside)
    
    if annotationView == nil {
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        annotationView?.canShowCallout = true
        annotationView?.calloutOffset = CGPoint(x: -5, y: 5)
        annotationView?.rightCalloutAccessoryView = detailsButton
    }
    else {
        annotationView?.annotation = annotation
    }
    
    annotationView?.image = UIImage(named: "logo")
    return annotationView
}

func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    self.selectedPoint = viewModel.getSelectedPoint((view.annotation?.title)!!)
}
}


extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.layer.backgroundColor = UIColor(red: 0.202, green: 0.796, blue: 0.473, alpha: 1.0).cgColor
    cell.layer.cornerRadius = 8
    return cell
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 103, height: 103)
}


func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Hello")
}

}

