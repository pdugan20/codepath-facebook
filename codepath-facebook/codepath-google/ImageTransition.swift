//
//  ImageTransition.swift
//  codepath-google
//
//  Created by Patrick Dugan on 6/6/15.
//  Copyright (c) 2015 dailydoog. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var tabBarController = fromViewController as! UITabBarController
        var tabBarChildViewControllers = tabBarController.viewControllers as! [UIViewController]
        var navigationController = tabBarChildViewControllers[0] as! UINavigationController
        
        var feedViewController = navigationController.topViewController as! FeedViewController
        var photoViewController = toViewController as! PhotoViewController

        var fromImageView = feedViewController.selectedImageView
        var toImageView = photoViewController.photoImageView
        
        fromImageView.alpha = 0
        toImageView.alpha = 0
        
        toViewController.view.alpha = 0
        
        transitionFromImageView(fromImageView, toImageView: toImageView, animations: {
            toViewController.view.alpha = 1
            }) { completed in
                toImageView.alpha = 1
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var tabBarController = toViewController as! UITabBarController
        var tabBarChildViewControllers = tabBarController.viewControllers as! [UIViewController]
        var navigationController = tabBarChildViewControllers[0] as! UINavigationController
        
        var feedViewController = navigationController.topViewController as! FeedViewController
        var photoViewController = fromViewController as! PhotoViewController
        
        var toImageView = feedViewController.selectedImageView
        var fromImageView = photoViewController.photoImageView
        
        fromImageView.alpha = 0
        
        transitionFromImageView(fromImageView, toImageView: toImageView, animations: {
            fromViewController.view.alpha = 0
            }) { completed in
                toImageView.alpha = 1
        }
    }
    
    func transitionFromImageView(fromImageView: UIImageView, toImageView: UIImageView, animations: () -> (), completion: (Bool) -> ()) {
        
        var window = fromImageView.window
        var transitionImageView = UIImageView(image: fromImageView.image)
        
        transitionImageView.contentMode = toImageView.contentMode
        transitionImageView.clipsToBounds = true
        transitionImageView.frame = window!.convertRect(fromImageView.frame, fromView: fromImageView.superview)
        
        window!.addSubview(transitionImageView)
        
        UIView.animateWithDuration(duration, animations: {
            transitionImageView.frame = window!.convertRect(toImageView.frame, fromView: toImageView.superview)
            animations()
            }) { (finished: Bool) -> Void in
                transitionImageView.removeFromSuperview()
                completion(finished)
                self.finish()
        }
    }
}
