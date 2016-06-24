
//
//  PostViewController.swift
//  MyApp
//
//  Created by 土屋陽香 on 2016/06/22.
//  Copyright © 2016年 Haruka Tsuchiya. All rights reserved.
//

import UIKit
import Photos

class PostViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!

    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var postButton: UIBarButtonItem!
    
    private var PostImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar.barTintColor = UIColor(hex: "1A237E")
        
        userProfileImage.layer.cornerRadius = userProfileImage.layer.bounds.width/2
        
        userProfileImage.clipsToBounds = true
        postText.text = ""
        postText.becomeFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }

    func keyboardWillHide(notification: NSNotification){
        self.postText.contentInset = UIEdgeInsetsZero
        self.postText.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification){
        let userInfo = notification.userInfo ?? [:]
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().size
        self.postText.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height+10, right: 0)
        self.postText.scrollIndicatorInsets = self.postText.contentInset
    }

    
    @IBAction func postButton_Clicked(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
        postText.becomeFirstResponder()
        
        
    }

//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        
//        return true
//    }

}
extension PostViewController: UIImagePickerControllerDelegate, UITabBarDelegate{
    @IBAction func PicFeaturedImage(sender:AnyObject) {
    
        
        let authorization = PHPhotoLibrary.authorizationStatus()
        if authorization == .NotDetermined{
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                dispatch_async(dispatch_get_main_queue(),{ () -> Void in
                    self.PicFeaturedImage(sender)
                })
            })
            return
        }
        
        
        if authorization == .Authorized{
            let controller = ImagePickerSheetController()
            controller.addAction(ImageAction(title: NSLocalizedString("Take a Photo or Video", comment: "ActionTitle"),
                secondaryTitle: NSLocalizedString("Use this one!", comment: "ActionTitle"), handler: { (_) -> () in
                    self.presentCamera()
                },
                
                secondaryHandler: { (action, numberOfPhoto) -> () in
                    
                    controller.getSelectedImagesWithCompletion({ (images) -> Void in
                        self.PostImage = images[0]
                        self.postImage.image = self.PostImage
                    })
            }))
            
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "ActuonTitle"), style: .Cancel, handler: nil))
            presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func presentCamera(){
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.postImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}






    