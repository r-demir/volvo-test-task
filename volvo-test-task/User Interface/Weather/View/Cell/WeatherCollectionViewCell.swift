//
//  WeatherCollectionViewCell.swift
//  volvo-test-task
//
//  Created by developer on 26.06.2022.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
    }
    
    func update(with title: String) {
        label.text = title
    }

}
