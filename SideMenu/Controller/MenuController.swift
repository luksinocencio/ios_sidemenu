import UIKit

private let reuseIdentifier = "cell"

class MenuController: UIViewController {
    
    // MARK: - Properties
    var tableview: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConfigureTableview()
    }
    
    // MARK: - Handlers
    
    func setupView() {
        view.backgroundColor = .darkGray
    }
    
    func setupConfigureTableview() {
        tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableview.separatorStyle = .none
        tableview.rowHeight = 60
        tableview.backgroundColor = .darkGray
        
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableview.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        
        cell.iconImageView.image = menuOption?.image
        cell.descriptionLabel.text = menuOption?.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}
