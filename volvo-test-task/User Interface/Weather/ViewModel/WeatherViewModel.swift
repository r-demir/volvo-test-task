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
        case loading(Bool)
        case alert(title: String, message: String)
    }
    
    typealias ChangeHandler = ((Change)->Void)
    
    private var changeHandler: ChangeHandler?
    
    func bind(changeHandler: ChangeHandler?) {
        self.changeHandler = changeHandler
    }
}
