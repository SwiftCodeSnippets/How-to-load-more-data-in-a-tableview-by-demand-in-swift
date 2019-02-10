//
//  Data.swift
//  MoviesList - LoadMore
//
//  Created by Niso on 2/4/19.
//  Copyright © 2019 Niso. All rights reserved.
//

import UIKit

// Movies Data
struct Data {
    
    static func getMoviesList() -> [String : [[String : Any]]] {
        
        var moviesList: [String : [[String : Any]]]
        
        moviesList = ["1":[["title": "Aquaman", "image": #imageLiteral(resourceName: "Aquaman")],
                           ["title": "Bumblebee",  "image": #imageLiteral(resourceName: "Bumblebee")],
                           ["title": "Mary Poppins Returns",  "image": #imageLiteral(resourceName: "MaryPoppinsReturns")],
                           ["title": "Creed II",  "image": #imageLiteral(resourceName: "CreedII")],
                           ["title": "Robin Hood",  "image": #imageLiteral(resourceName: "RobinHood")]
            ],
                      "2":[["title": "Black Panther", "image": #imageLiteral(resourceName: "BlackPanther")],
                           ["title": "Mission: Impossible - Fallout", "image": #imageLiteral(resourceName: "MissionImpossibleFallout")],
                           ["title": "Avengers: Infinity War", "image": #imageLiteral(resourceName: "AvengersInfinityWar")],
                           ["title": "A Star Is Born", "image": #imageLiteral(resourceName: "AStarIsBorn")],
                           ["title": "Deadpool 2", "image": #imageLiteral(resourceName: "Deadpool2")]
            ]
        ]
        
        return moviesList
    }
    
}
