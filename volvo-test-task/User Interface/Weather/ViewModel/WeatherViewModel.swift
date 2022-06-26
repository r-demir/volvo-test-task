//
//  WeatherViewModel.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit

class WeatherViewModel: NSObject {
    
    enum Change {
        case noInternet
        case reload
    }
    
    typealias ChangeHandler = ((Change)->Void)
    
    private var changeHandler: ChangeHandler?
    
    let REUSABLE_CELL_IDENTIFIER = String(describing: WeatherCollectionViewCell.self)
    
    var weatherResponse: WeatherResponse?
    
    func bind(changeHandler: ChangeHandler?) {
        self.changeHandler = changeHandler
    }
    
    func checkConnectivity(collectionView: UICollectionView) {
        if NetworkingManager.isConnected {
            collectionView.dataSource = self
            collectionView.delegate = self
        } else {
            self.changeHandler?(.noInternet)
        }
    }
}

extension WeatherViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? collectionView.frame.width / 2 : collectionView.frame.width
        return CGSize(width: width - 10, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return City.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REUSABLE_CELL_IDENTIFIER, for: indexPath) as! WeatherCollectionViewCell
        cell.update(with: City.allCases[indexPath.row], delegate: self)
        return cell
    }
     
}

extension WeatherViewModel: WeatherCollectionViewCellDelegate {
    
    func getWeatherInfo(city: City, callback: @escaping WeatherResponseHandler) {
        NetworkingManager.shared.getWeatherInfo(city: city) { response in
            callback(response)
        }
    }
    
}
