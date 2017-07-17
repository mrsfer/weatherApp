//
//  CoreDataService.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 13.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataService {
    
    static var weathersData: [NSManagedObject] = []
    
    static func saveToLocalBase(_ temperature: String, _ main: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        var managedContext: NSManagedObjectContext!
        
        if #available(iOS 10.0, *) {
            managedContext = appDelegate.persistentContainer.viewContext
        } else {
            managedContext = appDelegate.managedObjectContext
        }
        
        let entity =
            NSEntityDescription.entity(forEntityName: "WeatherForecast",
                                       in: managedContext)!
        
        let weather = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        
        
        weather.setValue(temperature, forKeyPath: "temperature")
        weather.setValue(main, forKeyPath: "weatherType")
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        timeFormatter.dateFormat = "hh:mm a"
        let dateString = dateFormatter.string(from: currentDate)
        let timeString = timeFormatter.string(from: currentDate)
        weather.setValue(dateString, forKey: "date")
        weather.setValue(timeString, forKey: "time")
        
        print("MapScreenInteractor/currentDate \(currentDate)")
        
        print("MapScreenInteractor/dateString \(dateString)")
        print("MapScreenInteractor/timeString \(timeString)")
        print("MapScreenInteractor/weather \(weather)")
        
        do {
            try managedContext.save()
            weathersData.append(weather)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    static func obtainListOfWeather() -> [Weather]  {
        
        var weathers = [Weather]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return weathers
        }
        
        var managedContext: NSManagedObjectContext!
        
        if #available(iOS 10.0, *) {
            managedContext = appDelegate.persistentContainer.viewContext
        } else {
            managedContext = appDelegate.managedObjectContext
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "WeatherForecast")
        do {
            weathersData = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        weathersData.reverse()
        
        for i in 0..<weathersData.count {
            
            let temperature = weathersData[i].value(forKeyPath: "temperature") as? String
            let main = weathersData[i].value(forKeyPath: "weatherType") as? String
            let date = weathersData[i].value(forKeyPath: "date") as? String
            let time = weathersData[i].value(forKeyPath: "time") as? String
            
            weathers.append(Weather(temperature!,main!,date!,time!))
        }
        
        return weathers
        
    }
 
    static func obtainLastWeather() -> Int {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return 0
        }
        
        var managedContext: NSManagedObjectContext!
        
        if #available(iOS 10.0, *) {
            managedContext = appDelegate.persistentContainer.viewContext
        } else {
            managedContext = appDelegate.managedObjectContext
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "WeatherForecast")
        do {
            weathersData = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        weathersData.reverse()
        
        if let temperature = weathersData[0].value(forKeyPath: "temperature") as? String {
            return Int(temperature)!
        } else {
            return -1000
        }
    }
    
}
