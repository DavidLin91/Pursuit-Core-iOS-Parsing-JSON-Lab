//
//  DetailedWeatherVC.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/2/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class DetailedWeatherVC: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherText: UILabel!
    
    var detailedWeather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        temperatureLabel.text = "\(detailedWeather.main["temp"] ?? 0.0) c"
        weatherText.text = detailedWeather.weather.first?.description
    }
    
    
}
