//
//  PhotoViewController.swift
//  Facebook Challenge
//
//  Created by Mike Jacobs on 6/5/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var photoActions: UIImageView!
    
    var image: UIImage!
    var zooming = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFit
        imageView.userInteractionEnabled = true
        imageView.image = image
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width + 1, self.view.frame.size.height + 1)
        
        doneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tappedDoneButton:"))
        
    }
    
    func tappedDoneButton(tapGestureRecognizer: UITapGestureRecognizer){
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if zooming {
            return
        }
        var alpha = 1 - (abs(scrollView.contentOffset.y) / scrollView.frame.height) * 2
        self.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        
        if abs(scrollView.contentOffset.y) > 100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.1){
            self.photoActions.alpha = 0
            self.doneButton.alpha = 0
        }
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView,
        withView view: UIView!){
            hideUI()
            self.zooming = true
            
    }
    func scrollViewDidEndZooming(scrollView: UIScrollView,
        withView view: UIView!,
        atScale scale: CGFloat){
            if(scale == 1.0){
                showUI()
                self.zooming = false
                scrollView.contentSize = CGSizeMake(self.view.frame.size.width + 1, self.view.frame.size.height + 1)
            }
    }
    
    func hideUI(){
        UIView.animateWithDuration(0.1){
            self.photoActions.alpha = 0
            self.doneButton.alpha = 0
        }
    }
    
    func showUI(){
        UIView.animateWithDuration(0.1){
            self.photoActions.alpha = 1
            self.doneButton.alpha = 1
        }
    }
    
    
}
