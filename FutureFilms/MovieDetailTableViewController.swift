//
//  MovieDetailContainer.swift
//  FutureFilms
//
//  Created by Patrick on 11/4/14.
//  Copyright (c) 2014 Patrick Triest. All rights reserved.
//
import UIKit

class MovieDetailTableViewController: UITableViewController {
    var movie: Movie!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReviewLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var movieDescriptionText: UITextView!
    @IBOutlet weak var moviePosterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitleLabel.text = movie.title
        movieReviewLabel.text = "Rating: " + movie.review
        movieReleaseDateLabel.text = "Release Date: " + movie.releaseDate
        movieDescriptionText.text = movie.description

        navigationItem.title = movie.title
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        movieTitleLabel.text = movie.title
        movieReviewLabel.text = "Rating: " + movie.review
        movieReleaseDateLabel.text = "Release Date: " + movie.releaseDate
        movieDescriptionText.text = movie.description
        moviePosterImage.image = movie.image

        navigationItem.title = movie.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    /*
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let navigationController = segue.destinationViewController as UINavigationController
        let editMovieViewController = navigationController.topViewController as EditMovieViewController
        
        editMovieViewController.movie = movie
    }
*/
}

