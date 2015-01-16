//
//  Ship.swift
//  Computer
//
//  Created by Kate Landmesser && Ricky Deal on 11/7/14.
//  Copyright (c) 2014 Redshift. All rights reserved.
//

import Foundation

struct Crewman{
    var firstname: String!
    var lastname: String!
    var rank: String!
    var authorization: String!
    var location: String!
}

public class Ship{
    var name: String!
    var location: String!
    var mission: String!
    var destination: String!
    
    var crew: [Crewman] = []
    
    init(){
        name = "Enterprise"
        mission = "to explore the Galaxy."
        destination = "the Alpha Quadrent"
        location = "Earth"
    }
    
    func lookup(lastname: String) -> Crewman{
        for crewmen in crew{
            if lastname == crewmen.lastname {
                return crewmen
            }
        }
        return Crewman(firstname: nil, lastname: nil, rank: nil, authorization: nil, location: nil)
    }
    
    func member(lastname: String) -> Bool{
        for crewmen in crew{
            if lastname == crewmen.lastname {
                return true
            }
        }
        return false
    }
    
    func addCrew(firstname: String, lastname: String, rank: String, authorization: String, location: String){
        crew.append(Crewman(firstname: firstname, lastname: lastname, rank: rank, authorization: authorization, location: location))
    }
}
