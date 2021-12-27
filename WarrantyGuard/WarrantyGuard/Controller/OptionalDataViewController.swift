//
//  OptionalDataViewController.swift
//  WarrantyGuard
//
//  Created by A A on 27/12/2021.
//

import UIKit

class OptionalDataViewController : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var notesTextField: UITextField!
  @IBOutlet weak var nextButton: UIButton!
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    Utilities.configureButtons(button: nextButton)
    configureHideKeyboardWhenRootViewTapped()
    
  }
  
  
  @IBAction func photoButton(_ sender: UIButton) {
    getPhoto(type: .photoLibrary)
  }
  
  
  @IBAction func cameraButton(_ sender: UIButton) {
    getPhoto(type: .camera)
  }
  
  
  @IBAction func nextButtonPressed(_ sender: UIButton) {
  }
  
  
  func getPhoto(type: UIImagePickerController.SourceType){
    let picker = UIImagePickerController()
    picker.sourceType = type
    picker.delegate = self
    present(picker, animated: true, completion: nil)
  }
  
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    dismiss(animated: true, completion: nil)
    guard let image = info[.originalImage] as? UIImage else {
      print("image not found")
      return
    }
    productImageView.image = image
  }
  
}