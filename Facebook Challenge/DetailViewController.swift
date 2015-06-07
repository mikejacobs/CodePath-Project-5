//
//  DetailViewController.swift
//  Facebook Challenge
//
//  Created by Mike Jacobs on 5/6/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailScroll: UIScrollView!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailScroll.contentSize = imageDetail.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func didPressLikeBtn(sender: AnyObject) {
        if (likeButton.selected == false){
            likeButton.selected = true
        }
        else {
            likeButton.selected = false
        }
        
    }

}
