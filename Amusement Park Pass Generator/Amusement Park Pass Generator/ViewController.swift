import UIKit
import Foundation

class ViewController: UIViewController {
    
    //connect the top row of buttons
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
     //connect the second row of buttons
    @IBOutlet weak var subTypeOne: UIButton!
    @IBOutlet weak var subTypeTwo: UIButton!
    @IBOutlet weak var subTypeThree: UIButton!
    @IBOutlet weak var subTypeFour: UIButton!
    
    //connect the first row of data
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var ssnField: UITextField!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var projectField: UITextField!
    
    //connect the second row of data
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameField: UITextField!
    
    //connect the fourth row of data
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyField: UITextField!
    
    //connect the fifth row of data
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var streetAddressField: UITextField!
    
    //connect the sixth row of data
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipField: UITextField!
    
    //connect bottom buttons
    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    
    //override with XYZ actions
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureTextFields()
        selectGuest()
        
        
    }


    private func configureTextFields() {
        dobField.delegate = self
        ssnField.delegate = self
        projectField.delegate = self
        firstNameField.delegate = self
        lastNameField.delegate = self
        companyField.delegate = self
        streetAddressField.delegate = self
        cityField.delegate = self
        stateField.delegate = self
        zipField.delegate = self
    }
    
    let subtleColor: UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.50, alpha: 0.1)
    let subtleColorLight: UIColor = UIColor(red: 1.0, green: 1.0, blue: 0.5, alpha: 0.1)
    let obviousColor: UIColor = UIColor(red: 31/255, green: 45/255, blue: 81/255, alpha: 1.0)
    let obviousColorLight: UIColor = .white
    
   private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
    }
    
    @objc func handleTap() {
    //line below copy and place in any buttons 
        view.endEditing(true)
    }
    
    /*
    //hide or unhide subtype buttons
    func hideSubTypeOptions(_ bool: Bool) {
        subTypeOne.isHidden = bool
        subTypeTwo.isHidden = bool
        subTypeThree.isHidden = bool
        subTypeFour.isHidden = bool
    }
 */
    
    //disable text field
    func disable(_ field: UITextField, withLabel label:UILabel ) {
        field.isUserInteractionEnabled = false
        field.backgroundColor = subtleColor
        label.textColor = subtleColor
    }
    
    func disableAllFields() {
        disable(dobField, withLabel: dobLabel)
        disable(ssnField, withLabel: ssnLabel)
        disable(projectField, withLabel: projectLabel)
        disable(firstNameField, withLabel: firstNameLabel)
        disable(lastNameField, withLabel: lastNameLabel)
        disable(companyField, withLabel: companyLabel)
        disable(streetAddressField, withLabel: streetAddressLabel)
        disable(cityField, withLabel: cityLabel)
        disable(stateField, withLabel: stateLabel)
        disable(zipField, withLabel: zipLabel)
    }
    
    func enable(_ field: UITextField, withLabel label:UILabel ) {
        field.isUserInteractionEnabled = true
        field.backgroundColor = .white
        label.textColor = obviousColor
    }
    
    func enableAllFields() {
        enable(dobField, withLabel: dobLabel)
        enable(ssnField, withLabel: ssnLabel)
        enable(projectField, withLabel: projectLabel)
        enable(firstNameField, withLabel: firstNameLabel)
        enable(lastNameField, withLabel: lastNameLabel)
        enable(companyField, withLabel: companyLabel)
        enable(streetAddressField, withLabel: streetAddressLabel)
        enable(cityField, withLabel: cityLabel)
        enable(stateField, withLabel: stateLabel)
        enable(zipField, withLabel: zipLabel)
    }
    
    func enableDobField() {
        enable(dobField, withLabel: dobLabel)
    }
    
    func enablePersonalFields() {
        enable(dobField, withLabel: dobLabel)
        enable(firstNameField, withLabel: firstNameLabel)
        enable(lastNameField, withLabel: lastNameLabel)
    }
    
    func enableAddressFields() {
        enable(streetAddressField, withLabel: streetAddressLabel)
        enable(cityField, withLabel: cityLabel)
        enable(stateField, withLabel: stateLabel)
        enable(zipField, withLabel: zipLabel)
    }
    
    
    func initialEntrantType() {
        guestButton.setTitleColor(subtleColor, for: .normal)
        employeeButton.setTitleColor(subtleColor, for: .normal)
        managerButton.setTitleColor(subtleColor, for: .normal)
        vendorButton.setTitleColor(subtleColor, for: .normal)
    }
    
    func initialSubType() {
        subTypeOne.setTitleColor(subtleColorLight, for: .normal)
        subTypeTwo.setTitleColor(obviousColorLight, for: .normal)
        subTypeThree.setTitleColor(subtleColorLight, for: .normal)
        subTypeFour.setTitleColor(subtleColorLight, for: .normal)
        subTypeFour.isHidden = false
    
    }
    
    func selectGuest() {
        initialEntrantType()
        initialSubType()
        disableAllFields()
        
        guestButton.setTitleColor(obviousColor, for: .normal)
      
        subTypeOne.setTitle("Child", for: .normal)
        subTypeTwo.setTitle("Adult", for: .normal)
        subTypeThree.setTitle("Senior", for: .normal)
        subTypeFour.setTitle("VIP", for: .normal)
        
    }
    
    func selectEmployee() {
        initialEntrantType()
        initialSubType()
        enableAllFields()
        disable(projectField, withLabel: projectLabel)
        disable(companyField, withLabel: companyLabel)
        
        employeeButton.setTitleColor(obviousColor, for: .normal)
        
        subTypeOne.setTitle("Food", for: .normal)
        subTypeTwo.setTitle("Ride", for: .normal)
        subTypeThree.setTitle("Maintenance", for: .normal)
        subTypeFour.setTitle("Contract", for: .normal)
        
    }
    
    func selectManager() {
        initialEntrantType()
        initialSubType()
        enableAllFields()
        disable(projectField, withLabel: projectLabel)
        disable(companyField, withLabel: companyLabel)
        
        managerButton.setTitleColor(obviousColor, for: .normal)
        
        subTypeOne.setTitle("Shift", for: .normal)
        subTypeTwo.setTitle("General", for: .normal)
        subTypeThree.setTitle("Senior", for: .normal)
        subTypeFour.isHidden = true
        
    }
    
    func selectVendor() {
        initialEntrantType()
        initialSubType()
        enablePersonalFields()
        
        vendorButton.setTitleColor(obviousColor, for: .normal)
        
        subTypeOne.setTitle("Acme", for: .normal)
        subTypeTwo.setTitle("Orkin", for: .normal)
        subTypeThree.setTitle("Fedex", for: .normal)
        subTypeFour.setTitle("NW Electrical", for: .normal)
        
        companyField.text = "Orkin"
        
    }
   
    
    @IBAction func chooseGuest(_ sender: Any) {
    selectGuest()
    }
    
    
    @IBAction func chooseEmployee(_ sender: Any) {
    selectEmployee()
    }
    
    @IBAction func chooseManager(_ sender: Any) {
    selectManager()
    }
    
    @IBAction func chooseVendor(_ sender: Any) {
    selectVendor()
    }
    
    
    
}
    

    


//allows keyboard to be dismissed when user hits 'return'
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}




