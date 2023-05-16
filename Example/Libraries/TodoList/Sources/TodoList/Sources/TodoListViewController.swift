import UIKit

protocol TodoListDisplayLogic: AnyObject {
    func display(name: String)
}

final class TodoListViewController: UIViewController {
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    private let viewModel: TodoListViewModeling

    init(viewModel: TodoListViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()

        viewModel.load()
    }

    private func configureView() {
        view.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            // nameLabel
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension TodoListViewController: TodoListDisplayLogic {
    func display(name: String) {
        nameLabel.text = "Welcome \(name)!"
    }
}
