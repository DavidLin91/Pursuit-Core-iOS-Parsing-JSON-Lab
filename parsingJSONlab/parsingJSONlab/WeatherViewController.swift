//
//  WeatherViewController.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/2/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherTV: UITableView!
    
    var weather = [Weather]() {
        didSet {
            weatherTV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        weatherTV.dataSource = self
    }
    
    func loadData() {
        weather = WeatherInfo.getWeather()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailWeather = segue.destination as? DetailedWeatherVC, let indexpath = weatherTV.indexPathForSelectedRow else {
        fatalError()
    }
        detailWeather.detailedWeather = weather[indexpath.row]
    }
}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTV.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let data = weather[indexPath.row]
        cell.textLabel?.text = data.name
        return cell
    }
}
