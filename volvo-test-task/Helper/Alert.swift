//
//  Alert.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import Foundation
import UIKit

struct Alert {
    
    static func show(title:String, message:String, actionTitle: String, _ callback: ((UIAlertAction)->Void)? = nil) {
        guard let vc = getWindow().rootViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: callback))
        vc.present(alert, animated: true, completion: nil)
    }
    
    private static func getWindow() -> UIWindow {
        guard let window = UIApplication.shared.delegate?.window  else {
            return UIWindow()
        }
        guard let window = window else {
            return UIWindow()
        }
        return window
    }
    
}
