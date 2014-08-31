//
//  detailViewController.swift
//  Person
//
//  Created by Christie Ferderer on 8/13/14.
//  Copyright (c) 2014 Christie Ferderer. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
{
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var fNameField: UITextField!
    @IBOutlet weak var lNameField: UITextField!
    @IBOutlet weak var gitHubNameField: UITextField!
    var textField: UITextField = UITextField()

    var selectedPerson : Person?
    var firstLoad = true
    var imageDownloadQueue = NSOperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fNameField.delegate = self
        self.lNameField.delegate = self
        self.gitHubNameField.delegate = self
        
        if self.selectedPerson!.image != nil{
            self.viewImage.image = selectedPerson?.image
        }else{
            var yikbbrkiE = UIImage(named: "yikbbrkiE")
            self.viewImage.image = yikbbrkiE
        }
    }
    override func viewWillLayoutSubviews() {
       // println("will layoutSubviews")
    }
    override func viewWillAppear(animated: Bool) {
    //super.viewWillAppear(animated)
    self.fNameField.text = self.selectedPerson?.firstName
    self.lNameField.text = selectedPerson?.lastName
    //if let gitHubName = self.selectedPerson?.gitHubName{
      //  self.gitHubNameField.delegate = self
        //}
    if self.firstLoad == true {
        self.firstLoad = false
    }
        println("view will appear")
    }
    override func viewDidAppear(animated: Bool) {
        if self.selectedPerson?.image == nil{
            if self.selectedPerson?.gitHubName != nil{
                //githubPicFunc()
            }
        }
    }
    func textFieldDidEndEditing(textField: UITextField!) {
        self.selectedPerson?.firstName = self.fNameField.text
        self.selectedPerson?.lastName = self.lNameField.text
        if  self.gitHubNameField.text != nil {
            self.selectedPerson?.gitHubName =  self.gitHubNameField.text
        }
        println(textField.text)
    }
    override func viewWillDisappear(animated: Bool) {
        //selectedPerson?.firstName = firstTextField.text
        //selectedPerson?.lastName = lastText.text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func photoButtonPressed(sender: AnyObject) {
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        println("user picked a photo")
        var editedImage = info[UIImagePickerControllerOriginalImage] as UIImage
        self.viewImage.image = editedImage
        self.selectedPerson!.image = editedImage
    }
    
   func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func gitHubEditButton(sender: AnyObject) {
       // if self.selectedPerson?.gitHubName == nil{
            var gitHubPrompt = UIAlertController(title: "GitHub", message: "Enter GitHub user name : ", preferredStyle: UIAlertControllerStyle.Alert)
            gitHubPrompt.addAction(UIAlertAction(title: "Enter", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                //if let mytextField = gitHubPrompt.textFields.first as? UITextField {
                    self.gitHubNameField.text = self.textField.text
                    self.selectedPerson?.gitHubName = self.gitHubNameField.text
                    self.gitHubNameField.text = self.selectedPerson?.gitHubName
                    self.gitHubPic(self.selectedPerson!.gitHubName!)
                })
                gitHubPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
                gitHubPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
                    textField.placeholder = "UserName"
            })
            self.presentViewController((gitHubPrompt), animated: true, completion: nil)
              
        
    }
         // gitHubPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.self, handler: nil)),
            //self.presentViewController(gitHubPrompt, animated: true, completion: nil),

    func gitHubPic(userName: String)-> Void{
        
        let gitHubURL = NSURL (string:"https://api.github.com/users/\(selectedPerson?.gitHubName?)")
        var photoURL = NSURL()
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(gitHubURL, completionHandler: {(data, response, error) -> Void in
        
            var error: NSError?
            
            let json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error:  &error) as NSDictionary
            //return (json, error)
            if error != nil {
                println("json error ")
            }
            if let avatarURL = json["avatar_url"] as? String {
                photoURL = NSURL(string: avatarURL)
            }
            if photoURL != nil{
                var downloadOpp = NSBlockOperation{() -> Void in
                    var picData = NSData(contentsOfURL: photoURL)
                    var picImage = UIImage (data: picData)
                    NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                    self.viewImage.image = picImage as UIImage
                    self.selectedPerson?.image = picImage as UIImage
                    
        
            })
        }
                //self.imageDownloadQueue.addOperation(downloadOperation)
                
    }
})
task.resume()
    }
}


