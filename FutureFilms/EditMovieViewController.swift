//
//  EditMovieViewController.swift
//  FutureFilms
//
//  Created by Patrick on 11/5/14.
//  Copyright (c) 2014 Patrick Triest. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class EditMovieViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var movie: Movie!
    var img: UIImage!
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleTextField: UITextField!
    @IBOutlet weak var movieReleaseDateTextField: UITextField!
    @IBOutlet weak var movieReviewTextField: UITextField!
    @IBOutlet weak var movieDescriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initialMovie = self.movie {
            movieImageView.image = initialMovie.image
            movieTitleTextField.text = initialMovie.title
            movieReleaseDateTextField.text = initialMovie.releaseDate
            movieReviewTextField.text = initialMovie.review
            movieDescriptionTextField.text = initialMovie.description
        }
    }
    
    @IBAction func cancelButtonTap(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func saveButtonTap(sender: UIBarButtonItem) {
        if movie == nil {
            movie = Movie(title: movieTitleTextField.text, description: movieDescriptionTextField.text, review: movieReviewTextField.text, releaseDate: movieReleaseDateTextField.text, image: movieImageView.image?)
            MovieManager.sharedMovieManager.movies.append(movie)
        }
        else {
            movie.title = movieTitleTextField.text
            movie.description = movieDescriptionTextField.text
            movie.image = movieImageView.image
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func handleImageTap(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imag.allowsEditing = false
            self.presentViewController(imag, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
        movieImageView.image = selectedImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
