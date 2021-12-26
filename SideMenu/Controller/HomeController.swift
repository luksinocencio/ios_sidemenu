import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureNavigationBar()
    }
    
    // MARK: - Handlers
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        
        let navStyles = UINavigationBar.appearance()
        navStyles.tintColor = .white
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .darkGray
            navBarAppearance.backgroundImage = UIImage()
            navBarAppearance.shadowImage = UIImage()
            navBarAppearance.shadowColor = .clear
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
        } else {
            navigationController?.navigationBar.barTintColor = .darkGray
            navigationController?.navigationBar.barStyle = .black
        }
        
        navigationController?.navigationBar.tintColor = UIColor.red

        let menuIcon = UIImage(systemName: "list.bullet")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuIcon, style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    // MARK: - Selectors
    
    @objc
    func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
}
