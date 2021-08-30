//
//  ViewController.swift
//  Sunrise and Sunset
//
//  Created by Jackson Barnes on 8/29/21.
//

import UIKit


var sunriseLabel: UILabel!
var sunsetLabel: UILabel!
var solarNoonLabel: UILabel!
var dayLengthLabel: UILabel!

var sunsetManager = SunsetManager()

class ViewController: UIViewController {
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var solarNoonLabel: UILabel!
    @IBOutlet weak var dayLengthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: SunsetManagerDelegate {
    func didFetchSunset(label: UILabel) {
        DispatchQueue.main.async {
            self.sunriseLabel.text = "\(sunrise.value)"
            self.dayLengthLabel.text = "\(dayLength.value)"
            self.solarNoonLabel.text = "\(solarNoon.value)"
            self.sunsetLabel.text = "\(sunset.value)"

        }
        sunsetManager.fetchSunset(sunset: Sunset)
        }
    func fetchDidFailWithError(error: Error?) {
        print (error as Any)
    }
    func didFetchSunset(label: UILabel){
        DispatchQueue.main.async {
            self.dayLengthLabel.text = dayLength
            self.solarNoonLabel.text = solarNoon
            self.sunriseLabel.text = sunrise
            self.sunsetLabel.text = sunset
        }
    }
    }
