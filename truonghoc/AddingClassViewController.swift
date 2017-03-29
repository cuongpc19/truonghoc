//
//  AddingClassViewController.swift
//  truonghoc
//
//  Created by AgribankCard on 2/4/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//

import UIKit

class AddingClassViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var classNameText: UITextField!
    var className : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        classNameText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //UITextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = classNameText.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }            
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        className = classNameText.text ?? ""
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
