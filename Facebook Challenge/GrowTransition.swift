//
//  GrowTransition.swift
//  
//
//  Created by Mike Jacobs on 6/4/15.
//
//

import UIKit

class GrowTransition: BaseTransition {
    
    var selectedImage: UIImageView!
    var tempImg: UIImageView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var toVc = toViewController as! PhotoViewController
        var fromVc = ((fromViewController as! UITabBarController).selectedViewController as! UINavigationController).topViewController as! FeedViewController
        
        toVc.view.alpha = 0
        toVc.imageView.alpha = 0
        
        tempImg = UIImageView()
        tempImg.image = selectedImage.image
        tempImg.frame = CGRectMake(selectedImage.frame.origin.x, selectedImage.frame.origin.y - fromVc.feedScrollView.contentOffset.y, selectedImage.frame.width, selectedImage.frame.height)
        tempImg.clipsToBounds = true
        tempImg.contentMode = .ScaleAspectFit
        tempImg.userInteractionEnabled = true
        
        containerView.addSubview(tempImg)
        
        UIView.animateWithDuration(duration, animations: {
            toVc.view.alpha = 1
            self.tempImg.frame = toVc.imageView.frame
            
            }) { (finished: Bool) -> Void in
                self.tempImg.alpha = 0
                toVc.imageView.alpha = 1
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var fromVc = fromViewController as! PhotoViewController
        var toVc = ((toViewController as! UITabBarController).selectedViewController as! UINavigationController).topViewController as! FeedViewController

        
        tempImg.frame = CGRectMake(fromVc.imageView.frame.origin.x, fromVc.imageView.frame.origin.y - fromVc.scrollView.contentOffset.y, fromVc.imageView.frame.width, fromVc.imageView.frame.height)
        tempImg.alpha = 1
        fromVc.imageView.alpha = 0
        
        
        UIView.animateWithDuration(duration, animations: {

            self.tempImg.frame = CGRectMake(self.selectedImage.frame.origin.x, self.selectedImage.frame.origin.y - toVc.feedScrollView.contentOffset.y, self.selectedImage.frame.width, self.selectedImage.frame.height)
            fromVc.view.alpha = 0
            
            }) { (finished: Bool) -> Void in
            
                self.tempImg.removeFromSuperview()
                self.finish()
        
        }
    }
}

