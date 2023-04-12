import UIKit

protocol MainViewDelegate: AnyObject {
    
    func didPressTravelButton(withYearsAhead yearsAhead: Int)
}

final class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    lazy var stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var label: UILabel = {
       
        let label = UILabel()
        label.text = "How many years ahead? 🗓️"
        label.textAlignment = .center
        return label
    }()
    
    lazy var textField: UITextField = {
       
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var button: UIButton = {

        let button = UIButton()
        button.setTitle("Travel to the future", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func buttonPressed() {
        
        guard let text = textField.text else {
            return
        }
        
        let yearsAhead = Int(text) ?? 0
        
        delegate?.didPressTravelButton(withYearsAhead: yearsAhead)
    }
}

private extension MainView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
