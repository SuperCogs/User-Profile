//
//  CompactUserProfileViewController.swift
//  UserProfile
//
//  Created by Milos on 4/18/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class CompactUserProfileViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let userProfileVC = segue.destinationViewController as? UserProfileViewController
        {
            userProfileVC.selectedLook = .Compact
        }
    }

}
