import UIKit

class SettingsController: UIViewController {
    
    // MARK: - Properties
    
    var username: String?
    
    // MARK: - Init
    
    init(username: String?) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeader()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    // MARK: - Helper Functions
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupHeader() {
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
        
//        navigationController?.navigationBar.prefersLargeTitles = true

        let closeIcon = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        guard let username = username else { return }
        
        navigationItem.title = "\(username) settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeIcon, style: .plain, target: self, action: #selector(handleClose))
    }
    
    // MARK: - Selectors
    
    @objc func handleClose() {
        dismiss(animated: true, completion: nil)
    }
}
