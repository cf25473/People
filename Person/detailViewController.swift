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
    
    var selectedPerson : Person?
   var firstLoad = true
    
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
    
    
    
    
    if self.firstLoad == true {
        self.firstLoad = false
    }
        println("view will appear")
    }
    func textFieldDidEndEditing(textField: UITextField!) {
        self.selectedPerson?.firstName = self.fNameField.text
        self.selectedPerson?.lastName = self.lNameField.text
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

}

