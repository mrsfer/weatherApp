//
//  WeatherDataTableViewCell.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 10.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit
import AVFoundation


class WeatherDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateOfMeasuringWeather: UILabel!
    @IBOutlet weak var timeOfMeasuringWeather: UILabel!
    @IBOutlet weak var temperatureOfChangingWeather: UILabel!
    @IBOutlet weak var viewForVideoWeather: UIView!
    
    var videoName: String!
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    
    let videoNameArray: Array = ["Mist", "Rain", "Clouds", "Haze", "Fog", "Clear", "Snow", "Thunderstorm"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupMoviePlayer(){
        
        createAVPlayer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.appEnteredForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        // Do any additional setup after loading the view.
    }
    
    func createAVPlayer() {
        
        DispatchQueue.main.async {
            
            let urlVideo = self.selectVideoWeatherType()
            if self.avPlayerLayer != nil {

                self.avPlayer!.pause()
                self.avPlayerLayer!.removeFromSuperlayer()
            }
            
            self.avPlayer = AVPlayer(url: urlVideo)
            
            self.avPlayerLayer = AVPlayerLayer(player: self.avPlayer)
            self.avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
 
            self.avPlayer.volume = 0
            self.avPlayer.actionAtItemEnd = .none
            
            self.avPlayerLayer.frame = self.viewForVideoWeather.layer.bounds
            self.viewForVideoWeather.backgroundColor = .clear
            
            self.viewForVideoWeather.layer.addSublayer(self.avPlayerLayer)
            
            self.avPlayer.play()
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.playerItemDidReachEnd(notification:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                   object: self.avPlayer.currentItem)

        }
    }
    
    func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero)
    }
    
    func appEnteredForeground() {
        if self.avPlayerLayer != nil {
            avPlayer.play()
        }
    }
    
    func selectVideoWeatherType() -> URL {
        
        var videoURL: URL? = nil
        for i in 0..<videoNameArray.count {
            
            if videoName == videoNameArray[i] {
                videoURL = Bundle.main.url(forResource: videoNameArray[i], withExtension: "mp4")
            }
            print("WeatherDataTableViewCell/selectVideoWeatherType/videoName \(videoName)")
        }
        
        if videoName == "Smoke" {
            videoURL = Bundle.main.url(forResource: "Mist", withExtension: "mp4")
        }
        
        if videoURL == nil {
            videoURL = Bundle.main.url(forResource: "Clouds", withExtension: "mp4")
        }
        return videoURL!
    }
    
}
