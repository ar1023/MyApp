//
//  PostInTableViewCell.swift
//  MyApp
//
//  Created by 土屋陽香 on 2016/06/22.
//  Copyright © 2016年 Haruka Tsuchiya. All rights reserved.
//

import UIKit

class PostInCommentTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var postImage: UIImageView!

    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var likeButton: DesignableButton!
    
    var post: Post!{
        didSet{
            updateUI()
        }
    }
    
    private var currentUserDidLike: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(){
        profileImage.image! = post.user.profileImage
        userNameLabel.text! = post.user.fullName
        createdAt.text! = post.createdAt
        postImage.image! = post.postImage
        postText.text! = post.postText
        
        likeButton.setTitle("🙆\(post.numberOfLikes)Likes", forState: .Normal)
        
        
        changeLikeButtonColor()
        configureButtonAppearence()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.layer.bounds.width/2
        profileImage.clipsToBounds = true
    }
    
    
    private func configureButtonAppearence(){
        likeButton.cornerRadius = 3.0
        likeButton.borderWidth = 2.0
        likeButton.borderColor = UIColor.lightGrayColor()
        likeButton.tintColor = UIColor.lightGrayColor()
        
    }
    
    private func changeLikeButtonColor(){
        if currentUserDidLike{
            likeButton.borderColor = UIColor(hex: "b94047")
            likeButton.tintColor = UIColor(hex: "b94047")
        }else{
            likeButton.borderColor = UIColor.lightGrayColor()
            likeButton.borderColor = UIColor.lightGrayColor()
        }
    }

    
    @IBAction func likeButton_Clicked(sender: DesignableButton) {
        post.userDidLike = !post.userDidLike
        changeLikeButtonColor()
        if post.userDidLike{
            post.numberOfLikes++
        }else{
            post.numberOfLikes--
        }
        
        likeButton.setTitle("🙆\(post.numberOfLikes)Likes", forState: .Normal)
        
        currentUserDidLike = post.userDidLike
        
        //animation
        sender.animation = "pop"
        sender.curve = "spring"
        sender.duration = 1.5
        sender.damping = 0.1
        sender.velocity = 0.2
        sender.animate()
    }
    
}
