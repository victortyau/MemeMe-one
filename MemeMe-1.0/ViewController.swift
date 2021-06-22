//
//  ViewController.swift
//  MemeMe-1.0
//
//  Created by Victor Tejada Yau on 06/20/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var topMessage: UITextField!
    @IBOutlet weak var bottomMessage: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.green  /* TODO: fill in appropriate UIColor */,
        NSAttributedString.Key.foregroundColor: UIColor.blue/* TODO: fill in appropriate UIColor */,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth: 1.0 /* TODO: fill in appropriate Float */
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        topMessage.defaultTextAttributes = memeTextAttributes
        topMessage.insertText("TOP")
        topMessage.textAlignment = .center
        
        bottomMessage.defaultTextAttributes = memeTextAttributes
        bottomMessage.insertText("BOTTOM")
        bottomMessage.textAlignment = .center
    }
    
    @IBAction func pickAnImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    func getKeyboardHeight(_ notification: Notification)  -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}

