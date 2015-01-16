//
//  ViewController.swift
//  Computer
//
//  Created by Kate Landmesser && Ricky Deal on 10/7/14.
//  Copyright (c) 2014 Redshift. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet var command: UITextField!
    @IBOutlet var compute: UIButton!
    @IBOutlet var response: UITextView!
    @IBOutlet var dismiss: UITapGestureRecognizer!
    var analyze: ComputerAnalyze!
    var ship: Ship!
    var locationManager: CLLocationManager = CLLocationManager()
    
    var input = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ship = Ship()
        addCrew()
                
        self.analyze = ComputerAnalyze(ship: ship)

        
        locationManager.requestWhenInUseAuthorization()
        
        // initilize GPS 
    }
    
    func addCrew(){
        self.ship.addCrew("kate", lastname: "landmesser", rank: "ensign", authorization: "A15324", location: "in engineering")
        self.ship.addCrew("ricky", lastname: "deal", rank: "ensing", authorization: "B55532", location: "on an away mission")
        self.ship.addCrew("jean-luc", lastname: "picard", rank: "captain", authorization: "A54323", location: "in his ready room")
        self.ship.addCrew("william", lastname: "riker", rank: "commander", authorization: "", location: "on the bridge")
        self.ship.addCrew("deanna", lastname: "troi", rank: "lieutenant-commander", authorization: "", location: "in her office")
        self.ship.addCrew("beverly", lastname: "crusher", rank: "commander", authorization: "", location: "in sick bay")
        self.ship.addCrew("", lastname: "data", rank: "lieutenant-commander", authorization: "", location: "on the bridge")
        self.ship.addCrew("geordi", lastname: "laforge", rank: "lieutenant-commander", authorization: "", location: "in Engineering")
        self.ship.addCrew("", lastname: "worf", rank: "lieutenant", authorization: "", location: "on the bridge")
        self.ship.addCrew("miles", lastname: "obrien", rank: "cheif petty officer", authorization: "", location: "in the transporter room")
        self.ship.addCrew("reginald", lastname: "barclay", rank: "lieutenant", authorization: "", location: "in the holodeck")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func computePressed(sender: AnyObject) {
        input = command.text as NSString
        
        if (input != ""){
            self.analyze.scan2(input)
            var output = self.analyze.response
            
            var speak: AVSpeechSynthesizer = AVSpeechSynthesizer()
            var speech: AVSpeechUtterance = AVSpeechUtterance (string: output)
            speech.rate = 0.10
            
            response.text = output
            
            speak.speakUtterance(speech)
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
}

