//
//  FirstViewController.swift
//  MyApp
//
//  Created by 土屋陽香 on 2016/06/22.
//  Copyright © 2016年 Haruka Tsuchiya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UINavigationControllerDelegate {
    
    @IBOutlet weak var navi: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    var post = Post.allPosts

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "postCell")
        
       
//        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        navigationBar.barTintColor = UIColor(hex: "1A237E")
        
        //changeLikeButtonColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    

}

extension FirstViewController: UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostTableViewCell
        cell.post = post[indexPath.row]
        cell.delegate = self
        return cell
    }
    
}

extension FirstViewController: PostTableViewCellDelegate{
    func commentButton_Clicked(post: Post) {
        self.performSegueWithIdentifier("Show Comment Page", sender: post)
    }
}
