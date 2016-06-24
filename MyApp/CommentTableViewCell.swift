//
//  CommentTableViewCell.swift
//  MyApp
//
//  Created by 土屋陽香 on 2016/06/22.
//  Copyright © 2016年 Haruka Tsuchiya. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfileImage: UIImageView!

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

        var comment: Comment!{
            didSet{
                updateUI()
            }
        }
        
        private func updateUI(){
            userProfileImage.image! = comment.user.profileImage
            userNameLabel.text! = comment.user.fullName
            createdAt.text! = comment.createdAt
            commentLabel.text! = comment.commentText
            
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            userProfileImage.layer.cornerRadius = userProfileImage.layer.bounds.width/2
            userProfileImage.clipsToBounds = true
            
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
}


