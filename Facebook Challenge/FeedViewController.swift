//
//  FeedViewController.swift
//  Facebook Challenge
//
//  Created by Mike Jacobs on 5/6/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var imagesGroup: [UIImageView]!
    
    var selectedImage: UIImageView!
    var growTransition: GrowTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScrollView.contentSize = imageView.image!.size
        
        for img in imagesGroup {
            img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tappedView:"))
        }
    }

    func tappedView(tapGestureRecognizer: UITapGestureRecognizer){
        selectedImage = tapGestureRecognizer.view as! UIImageView
        performSegueWithIdentifier("imageDetailSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.selectedImage.image
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        growTransition = GrowTransition()
        growTransition.selectedImage = selectedImage
        growTransition.duration = 0.3
        destinationViewController.transitioningDelegate = growTransition
    }

}
