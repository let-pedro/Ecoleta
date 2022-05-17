import UIKit
import MessageUI
import Contacts
import ContactsUI


protocol DetailsViewControllerDelegate {
    func sendEmail(_ viewController: UIViewController)
    
    
}

class DetailsVC: UIViewController {
    
    private var DetailsView: DetailsView
    private let selectedPoint: CollectorPoint
    
    //MARK: - Setup
    
    
    init(Point: CollectorPoint) {
        self.DetailsView = Ecoleta.DetailsView()
        self.selectedPoint = Point
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = DetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsMain()
    }
    
    
    private func settingsMain(){
        buttonCall()
        showData()
    }
    
    //MARK: - Main

    func showData(){
        var items = ""
        for item in selectedPoint.collectItems {
            items += "\(item.name),"
        }
        

        DetailsView.imageEstablishment.image = UIImage(named: selectedPoint.image)!
        DetailsView.nameOfEstablishment.text = selectedPoint.entityName
        DetailsView.typeItems.text = items
        DetailsView.address.text = "\(selectedPoint.state),\(selectedPoint.city) ,\(selectedPoint.location[0].street), \(selectedPoint.location[0].number)"
    }
    
    
    // MARK: - button action

    private func buttonCall(){
        DetailsView.emailButton.addTarget(self, action: #selector(tapSendEmailButton), for: .touchUpInside)
    }
    
    @objc func tapSendEmailButton(){
        guard MFMailComposeViewController.canSendMail() else { return}
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients([selectedPoint.email])
        composer.setSubject(selectedPoint.entityName)
        composer.setMessageBody("Olá bem vindo ao \(selectedPoint.entityName), como podemos ajudar ? ", isHTML: true)
        present(composer, animated: true)
    }
    
    @objc func tapSendWhatsappButton(){
        print("NOT")
    }
}


// MARK: -  Extensions


extension DetailsVC: MFMailComposeViewControllerDelegate {

func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
}
}
