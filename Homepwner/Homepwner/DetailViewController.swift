//
//  File.swift
//  Homepwner
//
//  Created by Stefano Pernat on 27/10/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //IBoutlets
    @IBOutlet weak var nameField: RTextField!
    @IBOutlet weak var serialNumberField: RTextField!
    @IBOutlet weak var valueField: RTextField!
    @IBOutlet weak var dateLabel: RTextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        return formatter
    }()
    
    // the selected item
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    var imageStore: ImageStore!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        // retrive the image from imageStore
        let associatedImage = imageStore.image(forKey: item.itemKey)
        
        // set imageview image
        imageView.image = associatedImage
    }
    
    // save changes to item when pressed the back button
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
    
    // text field respond to the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "changeDate"?:
            let changeDateViewController = segue.destination as! ChangeDateViewController
            changeDateViewController.item = item
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // get a reference to a image from the ImagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Store the image into the imageStore
        imageStore.setImage(image, forKey: item.itemKey)
        
        // put the image inside imageview
        imageView.image = image
        
        // dismiss the imagepicker
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        // Bronze challenge
        imagePicker.allowsEditing = true
        
        // if device has a camera take a picture, otherwise select from the photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
}
