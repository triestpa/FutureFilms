//
//  MoviesTableViewController.swift
//  FutureFilms
//
//  Created by Patrick on 11/4/14.
//  Copyright (c) 2014 Patrick Triest. All rights reserved.
//

import Foundation
import UIKit

class MoviesTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    let movieManager = MovieManager.sharedMovieManager
    var filteredMovies = [Movie]?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        if tableView == searchDisplayController!.searchResultsTableView {
            if filteredMovies == nil {
                return 0
            }
            else {
                return filteredMovies!.count
            }
        }
        else {
            return movieManager.movies.count
       }
        */
        return movieManager.movies.count
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("MoviesTableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        
        var thisMovie:Movie
        /*
        if tableView == searchDisplayController!.searchResultsTableView {
            thisMovie = filteredMovies![indexPath.row]
        }
        else {
            thisMovie = movieManager.movies[indexPath.row]
        }
        */
        thisMovie = movieManager.movies[indexPath.row]
        
        cell.textLabel.text = thisMovie.title
        cell.detailTextLabel?.text = thisMovie.releaseDate
        cell.imageView.image = thisMovie.image
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            movieManager.movies.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let movieToMove = movieManager.movies[fromIndexPath.row]
        movieManager.movies.removeAtIndex(fromIndexPath.row)
        movieManager.movies.insert(movieToMove, atIndex: toIndexPath.row)
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "movieDetailSegue" {
            let destinationViewController = segue.destinationViewController as MovieDetailTableViewController
            
            //if search results are vsibile
            if searchDisplayController!.active {
                if let selectedRow = searchDisplayController?.searchResultsTableView.indexPathForSelectedRow()?.row {
                    destinationViewController.movie = filteredMovies?[selectedRow]
                }
            } else {
                let thisMovie = movieManager.movies[tableView.indexPathForSelectedRow()!.row]
                destinationViewController.movie = thisMovie
            }
        }
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        filteredMovies = movieManager.filteredMovies(searchString)
        return true
    }
*/
    
    
}
