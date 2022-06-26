//
//  WeatherViewController.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: WeatherViewModel?
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "WeatherViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("WeatherViewController implementation error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.navigationItem.title = "Weather"
        let nib = UINib(nibName: String(describing: WeatherCollectionViewCell.self), bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: String(describing: WeatherCollectionViewCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bindViewModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unbindViewModel()
    }
    
    @IBAction func clicked(_ sender: Any) {
        self.navigationController?.pushViewController(WeatherViewController(viewModel: WeatherViewModel()), animated: true)
    }
    
}

private extension WeatherViewController {
    
    func bindViewModel() {
        viewModel?.bind {[weak self] change in
            switch change {
                case .noInternet:
                    Alert.show(title: "Warning", message: "No internet connection", actionTitle: "Okay") { _ in
                        self?.viewWillAppear(true)
                    }
                case .reload:
                    self?.collectionView.reloadData()
            }
        }
        viewModel?.checkConnectivity(collectionView: self.collectionView)
    }
    
    func unbindViewModel() {
        viewModel?.bind(changeHandler: nil)
    }
    
}


