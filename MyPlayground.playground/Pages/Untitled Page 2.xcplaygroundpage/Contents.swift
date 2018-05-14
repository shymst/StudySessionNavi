
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()

    let fromLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.numberOfLines = 0
        return label
    }()

    let toLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.numberOfLines = 0
        return label
    }()

    let planStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .red
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        for _ in 1...4 {
            let tagLabel = UILabel()
            tagLabel.layer.cornerRadius = 2
            tagLabel.backgroundColor = .groupTableViewBackground
            tagLabel.translatesAutoresizingMaskIntoConstraints = false
            tagLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
            tagStackView.addArrangedSubview(tagLabel)
        }
        stackView.addArrangedSubview(tagStackView)

        fromLabel.text = "ああああああああああああああああああああああああああああああああああああああああああああああ"
        stackView.addArrangedSubview(fromLabel)

        toLabel.text = "いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい"
        stackView.addArrangedSubview(toLabel)

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //        stackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

