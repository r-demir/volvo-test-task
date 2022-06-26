//
//  WeatherCollectionViewCell.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import SwiftyJSON

protocol WeatherCollectionViewCellDelegate {
    func getWeatherInfo(city: City, callback: @escaping WeatherResponseHandler)
}

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
    }
    
    func update(with city: City, delegate: WeatherCollectionViewCellDelegate?) {
        delegate?.getWeatherInfo(city: city) { response in
            guard let response = response else { return }
            self.update(title: response.name ?? "-")
            print("\n\n\n")
            print("City >>> \(city.rawValue)")
            print(JSON(response.toJSON()))
            print("\n\n\n")
        }
    }
    
    private func update(title: String) {
        self.label.text = title
    }
}
