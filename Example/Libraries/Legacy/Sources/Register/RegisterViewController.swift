import UIKit

final class RegisterViewController: UIViewController {
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name"
        return textField
    }()
    
    private let viewModel: RegisterViewModeling
    
    init(viewModel: RegisterViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        textField.delegate = self
        configureView()
    }
    
    private func configureView() {
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            // textField
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.text?.isEmpty == false, let text = textField.text else {
            return false
        }
        
        viewModel.submit(name: text)
        return true
    }
}
