@IBOutlet var name1: UITextField!

@IBOutlet var name2: UITextField!

@IBOutlet var name3: UITextField!

@IBOutlet var name4: UITextField!

@IBOutlet var newButton: UIButton!
 

let textfields : [UITextField] = [name1, name2, name3, name4]
for textfield in textfields {
  textfield.addtarget(self, #selector(textFieldDidChange(_:), forControlEvents: .EditingChanged)
}


func textFieldDidChange(textField: UITextField) {
    if name1.text?.isEmpty || name2.text?.isEmpty || name3.text?.isEmpty || name4.text?.isEmpty {
        //Disable button
    } else {
        //Enable button
    }
}
