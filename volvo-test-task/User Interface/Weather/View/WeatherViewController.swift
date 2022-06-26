//
//  WeatherViewController.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import SwiftyJSON

class WeatherViewController: UIViewController {

    private var viewModel: WeatherViewModel?
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "WeatherViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("WeatherViewController implementation Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weathers"
        
        NetworkingManager.shared.getWeatherInfo { response in
            guard let response = response else { return }
            print(JSON(response.toJSON()))
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindViewModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unbindViewModel()
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
                    break
                case .alert(title: let title, message: let message):
                    break
                case .loading(let isLoading):
                    break
            }
        }
    }
    
    func unbindViewModel() {
        viewModel?.bind(changeHandler: nil)
    }

    
}
