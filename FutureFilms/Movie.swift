//
//  Moive.swift
//  FutureFilms
//
//  Created by Patrick on 11/4/14.
//  Copyright (c) 2014 Patrick Triest. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    var title: String
    var description: String
    var review: String
    var releaseDate: String
    var image: UIImage?
    
    init(title: String, description: String, review: String, releaseDate: String, image: UIImage? = nil){
        self.title = title
        self.description = description
        self.review = review
        self.releaseDate = releaseDate
        self.image = image
    }
}