//
//  CommentViewController.swift
//  MyApp
//
//  Created by 土屋陽香 on 2016/06/22.
//  Copyright © 2016年 Haruka Tsuchiya. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar.barTintColor = UIColor(hex: "1A237E")
        
        let nib = UINib(nibName: "PostInCommentTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "postInCommentCell")
        let nib2 = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.registerNib(nib2, forCellReuseIdentifier: "commentCell")
        //createNewButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
