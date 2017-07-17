//
//  ListOfWeatherViewController.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 10.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit
import CoreData

class ListOfWeatherViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var weathers: [Weather] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.parent?.navigationItem.title = "Список погоды"
        self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(updateList))
        updateList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension /// Autoresize height row
        self.tableView.estimatedRowHeight = 300.0
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        ///updateList()
        
        print("ListOfWeatherViewController/weather.count \(weathers.count)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.parent?.navigationItem.title = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateList(){
        DispatchQueue.main.async {
            self.startLoading()
            self.weathers.removeAll()
            self.weathers = CoreDataService.obtainListOfWeather()
            
            self.tableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            self.stopLoading()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weathers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! WeatherDataTableViewCell!
        
        if weathers.count > 0 {
            
            let weather = weathers[indexPath.row]
        
            cell?.dateOfMeasuringWeather.text = weather.date
            cell?.timeOfMeasuringWeather.text = weather.time
            cell?.temperatureOfChangingWeather.text = weather.temperature
            cell?.videoName = weather.weatherType
            cell?.setupMoviePlayer()
        }
        return cell!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
