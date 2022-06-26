//
//  WeatherCollectionViewCell.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit
import SkeletonView
import ImageLoader

protocol WeatherCollectionViewCellDelegate {
    func getWeatherInfo(city: City, callback: @escaping WeatherResponseHandler)
}

class WeatherCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var response: WeatherResponse?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
        self.weatherImageView.skeletonCornerRadius = 6
        self.weatherImageView.clipsToBounds = true
        self.isSkeletonable = true
    }
    
    func update(with city: City, delegate: WeatherCollectionViewCellDelegate?) {
        guard let _ = self.response else {
            self.showSkeleton(usingColor: .gray, animated: true, delay: 0.0, transition: .crossDissolve(0.25))
            delegate?.getWeatherInfo(city: city) { response in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.hideSkeleton()
                    self.response = response
                    self.update(title: response?.name ?? "-")
                    self.update(imageUrl: response?.weather?.first?.imageUrl)
                    self.update(weather: response?.weather?.first?.main ?? "-")
                    self.update(description: response?.weather?.first?.description ?? "-")
                    self.update(temperature:  response?.main?.temp)
                }
            }
            return
        }
    }
    
    private func update(title: String) {
        self.cityNameLabel.text = title
    }
    
    private func update(imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }
        self.weatherImageView.load.request(with: url)
    }
    
    private func update(weather: String) {
        self.weatherLabel.text = weather
    }
    
    private func update(description: String) {
        self.descriptionLabel.text = description
    }
    
    private func update(temperature: Int?) {
        guard let temperature = temperature else {
            self.temperatureLabel.text = "-"
            return
        }
        self.temperatureLabel.text = "\(temperature)°C"
    }
}
