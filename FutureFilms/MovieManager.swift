//
//  MovieManager.swift
//  FutureFilms
//
//  Created by Patrick on 11/4/14.
//  Copyright (c) 2014 Patrick Triest. All rights reserved.
//

import Foundation
import UIKit

private let movieManagerInstance = MovieManager()

class MovieManager {
    var movies = [Movie]()
    
    //class is synonymous to static
    class var sharedmovieManager: MovieManager {
        return movieManagerInstance
    }
    
    init() {
        let interstellarMovie = Movie(
            title: "Interstellar",
            description: "A group of explorers make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage. (169 mins.)",
            review: "9.4",
            releaseDate: "11-7-2014",
            image: UIImage(named: "interstellar"))
        movies.append(interstellarMovie)
        
        let furyMovie = Movie(
            title: "Fury",
            description: "April, 1945. As the Allies make their final push in the European Theatre, a battle-hardened army sergeant named Wardaddy commands a Sherman tank and his five-man crew on a deadly mission behind enemy lines. Out-numbered, out-gunned, and with a rookie soldier thrust into their platoon, Wardaddy and his men face overwhelming odds in their heroic attempts to strike at the heart of Nazi Germany. (134 mins.)",
            review: "8.1",
            releaseDate: "10-17-2014",
            image: UIImage(named: "fury"))
        movies.append(furyMovie)
        
        let hobbitMovie = Movie(
            title: "The Hobbit: The Battle of the Five Armies",
            description: "Bilbo and Company are forced to be embraced in a war against an armed flock of combatants and the terrifying Smaug from acquiring a kingdom of treasure and obliterating all of Middle-Earth.",
            review: "9.6",
            releaseDate: "12-17-2014",
            image: UIImage(named: "hobbit"))
        movies.append(hobbitMovie)
    }
    
    func filteredMovies(searchText: String) -> [Movie] {
        let filteredMovies = movies.filter { (movie: Movie) -> Bool in
            let titleMatch = movie.title.rangeOfString(searchText, options: .CaseInsensitiveSearch)
            let descriptionMatch = movie.description.rangeOfString(searchText, options: .CaseInsensitiveSearch)
            
            return titleMatch != nil || descriptionMatch != nil
        }
        return filteredMovies
    }
}