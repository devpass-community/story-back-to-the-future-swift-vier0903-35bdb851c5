import UIKit

final class MainViewController: UIViewController {

    private lazy var mainView: MainView = {

        let mainView = MainView()
        mainView.delegate = self
        return mainView
    }()


    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Future App ⏰"
    }

    override func viewDidAppear(_ animated: Bool) {

    }

    override func loadView() {
        self.view = mainView
    }
}

extension MainViewController: MainViewDelegate {
    
    func didPressTravelButton(withYearsAhead yearsAhead: Int) {
        
        guard let dateAhead = Date().dateAfter(years: yearsAhead) else {
            return
        }
        let formattedDate = dateAhead.formattedDate()
        let message = "We're going to \(formattedDate)"
        
        let alertController = UIAlertController(title: "Time to travel!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Let's go", style: .default))
        present(alertController, animated: true)
    }
}
