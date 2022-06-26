//
//  WeatherViewModel.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import SwiftyJSON

class WeatherViewModel: NSObject {
    
    enum Change {
        case noInternet
        case loading(Bool)
        case alert(title: String, message: String)
        case reload
    }
    
    typealias ChangeHandler = ((Change)->Void)
    
    private var changeHandler: ChangeHandler?
    
    let REUSABLE_CELL_IDENTIFIER = String(describing: WeatherCollectionViewCell.self)
    
    var dataCount = 0 {
        didSet {
            self.changeHandler?(.reload)
        }
    }
    
    var weatherResponse: WeatherResponse?
    
    func bind(changeHandler: ChangeHandler?) {
        self.changeHandler = changeHandler
    }
    
    func getWeatherInfo(){
        self.changeHandler?(.loading(true))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            NetworkingManager.shared.getWeatherInfo { response in
                print(JSON(response?.toJSON()))
                self.weatherResponse = response
                self.dataCount = 6
                self.changeHandler?(.loading(false))
            }
        }
    }
}

extension WeatherViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? collectionView.frame.width / 2 : collectionView.frame.width
        return CGSize(width: width - 10, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REUSABLE_CELL_IDENTIFIER, for: indexPath) as! WeatherCollectionViewCell
        cell.update(with: "Cell Number #\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: will be implemented
    }
     
}
