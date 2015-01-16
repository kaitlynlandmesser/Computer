//
//  ComputerAnalyze.swift
//  Computer
//
//  Created by Kate Landmesser && Ricky Deal on 10/16/14.
//  Copyright (c) 2014 Redshift. All rights reserved.
//

import Foundation
import CoreLocation

var location: CLLocation = CLLocation()

class ComputerAnalyze{
    var text: String!
    var response: String!
    var ship: Ship!
    
    init(ship: Ship){
        self.ship = ship
        response = "Please state a valid inquiry or command."
    }
    
    func scan2(input: String){
        text = input.lowercaseString
        // scan string until you find spaces, then compare with keywords list
        text = text.stringByReplacingOccurrencesOfString("?", withString: " ")
        text = text.stringByReplacingOccurrencesOfString("!", withString: " ")
        text = text.stringByReplacingOccurrencesOfString(",", withString: " ")

        var testArr = text.componentsSeparatedByString(" ")
        
        var verb = testArr[1];
        
        if (testArr[0] == "computer"){
            switch verb{
                //crewman or starship
            case "where", "locate", "is":
                for (var i = 2; i < testArr.count; i++){
                    if (testArr[i] == "crewman" || testArr[i] == "captain" || testArr[i] == "capt." || testArr[i] == "ensign" || testArr[i] == "lieut." || testArr[i] == "lieutenant" || testArr[i] == "commander" || testArr[i] == "cmdr." || testArr[i] == "admiral"){
                        var lname = testArr[i+1]
                        var crew: Crewman = self.ship.lookup(lname)
                        
                        if (crew.location == nil) {
                            response = ("\(testArr[i]) \(crew.firstname) \(lname) is not on the ship.")
                        }else{
                            response = ("\(crew.rank) \(crew.firstname) \(lname) is \(crew.location).")
                        }
                    } else if (testArr[i] == "we" || testArr[i] == "i"){
                        response = "We are in orbit around \(self.ship.location)"
                    }else if (testArr[i] == "starship"){
                        response = "The Starship \(self.ship.name) is in orbit around \(self.ship.location)"
                    }
                }
                break
                //location, destination, mission
            case "what":
                for (var i = 2; i < testArr.count; i++){
                    if (testArr[i] == "location"){
                        response = "The Starship \(self.ship.name) is in orbit around \(self.ship.location)"
                    } else if (testArr[i] == "destination"){
                        response = "The destination of the Starship \(self.ship.name) is \(self.ship.destination)"
                    } else if (testArr[i] == "mission"){
                        response = "The mission of the Starship \(self.ship.name) is \(self.ship.mission)"
                    } else if (testArr[i] == "date"){
                        let date = NSDate()
                        let calendar = NSCalendar.currentCalendar()
                        
                        let components = calendar.components(.MonthCalendarUnit | .DayCalendarUnit | .YearCalendarUnit, fromDate: date)
                       
                        var day = components.day
                        var year = components.year
                        var month = components.month
                        
                        var nums = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]
                        
                        var dayofyear = nums[month - 1] + day
                        
                        response = "The date is \(year).\(dayofyear)"
                    }
                }
                break
            case "open":
                for (var i = 2; i < testArr.count; i++){
                    if (testArr[i] == "log"){
                        
                    }
                }
                break
            case "modify", "change", "update":
                for (var i = 2; i < testArr.count; i++){
                    if (testArr[i] == "mission"){
                        var newmission = ""
                        for (var j = i+1; j < testArr.count; j++){
                            newmission += " \(testArr[j])"
                        }
                        
                        self.ship.mission = newmission
                        response = "Okay, mission modified."
                        
                    } else if (testArr[i] == "destination"){
                        var newdest = ""
                        for (var j = i+2; j < testArr.count; j++){
                            newdest += " \(testArr[j])"
                        }
                        
                        self.ship.destination = newdest
                        response = "Okay, destination modified."
                    }
                }
                break
                
            case "initiate":
                for (var i = 2; i < testArr.count; i++){
                    if (testArr[i] == "destruct"){
                        response = "Destruct sequence engaged."
                    }
                }
                break
            default:
                break
            }
        }else {
            response = " "
        }
    }
}


