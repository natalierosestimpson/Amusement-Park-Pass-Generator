import UIKit
import Foundation



class ViewController: UIViewController {
    
    var nameText = ""
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
    @IBOutlet weak var subTypeFive: UIButton!
    
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
    
    @IBOutlet weak var checkDataButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        checkDataButton.isHidden = false
        generatePassButton.isHidden = true
        populateDataButton.isHidden = false
        enableAllFields()

        selectGuest()
    }
    
    let subtleColor = Colors().subtleColor
    let subtleColorLight = Colors().subtleColorLight
    let obviousColor = Colors().obviousColor
    let obviousColorLight = Colors().obviousColorLight
    
    //clear text fiels
    func clearField(_ field: UITextField) {
        field.text = ""
    }
    
    //clear all text fields
    func clearAllFields() {
        clearField(dobField)
        clearField(ssnField)
        clearField(projectField)
        clearField(firstNameField)
        clearField(lastNameField)
        clearField(companyField)
        clearField(streetAddressField)
        clearField(cityField)
        clearField(stateField)
        clearField(zipField)
        
        dobField.text = "DD/MM/YYYY"
        ssnField.text = "###-##-####"
        projectField.text = "######"
    }

    //disable text field
    func disable(_ field: UITextField, withLabel label:UILabel ) {
        field.isUserInteractionEnabled = false
        field.backgroundColor = subtleColor
        label.textColor = subtleColor}

   //disable all text fields
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
    
    //enable a text field
    func enable(_ field: UITextField, withLabel label:UILabel ) {
        field.isUserInteractionEnabled = true
        field.backgroundColor = .white
        label.textColor = obviousColor
    }
    
    //enable all text fields
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
    
    //enable only the date of birth text field
    func enableDobField() {
        enable(dobField, withLabel: dobLabel)
    }
    
    //enable only the personal dat text fields
    func enablePersonalFields() {
        enable(dobField, withLabel: dobLabel)
        enable(firstNameField, withLabel: firstNameLabel)
        enable(lastNameField, withLabel: lastNameLabel)
    }
    
    //enable only the address text fields
    func enableAddressFields() {
        enable(streetAddressField, withLabel: streetAddressLabel)
        enable(cityField, withLabel: cityLabel)
        enable(stateField, withLabel: stateLabel)
        enable(zipField, withLabel: zipLabel)
    }
    
    //resets the storyboard scene to initial view
    func initialEntrantType() {
        guestButton.setTitleColor(subtleColor, for: .normal)
        employeeButton.setTitleColor(subtleColor, for: .normal)
        managerButton.setTitleColor(subtleColor, for: .normal)
        vendorButton.setTitleColor(subtleColor, for: .normal)
        clearAllFields()
        disableAllFields()
    }
    
    //resets the storyboard scene to initial view
    func showAllSubTypesAsSubtle() {
        subTypeOne.setTitleColor(subtleColorLight, for: .normal)
        subTypeTwo.setTitleColor(subtleColorLight, for: .normal)
        subTypeThree.setTitleColor(subtleColorLight, for: .normal)
        subTypeFour.setTitleColor(subtleColorLight, for: .normal)
        subTypeFive.setTitleColor(subtleColorLight, for: .normal)
    }
    
     //resets the storyboard scene to initial view
    func initialSubType() {
        showAllSubTypesAsSubtle()
        subTypeOne.setTitleColor(obviousColorLight, for: .normal)
        
        subTypeOne.isHidden = false
        subTypeTwo.isHidden = false
        subTypeThree.isHidden = false
        subTypeFour.isHidden = false
        subTypeFive.isHidden = false
        
        checkDataButton.isHidden = false
        generatePassButton.isHidden = true
        populateDataButton.isHidden = false
    }
    
    //updates formatting when Guest is selected
    func selectGuest() {
        initialEntrantType()
        initialSubType()
        selectChildGuest()
        
        guestButton.setTitleColor(obviousColor, for: .normal)
      
        subTypeOne.setTitle("Child", for: .normal)
        subTypeTwo.setTitle("Adult", for: .normal)
        subTypeThree.setTitle("Senior", for: .normal)
        subTypeFour.setTitle("VIP", for: .normal)
        subTypeFive.setTitle("Season Pass", for: .normal)
    }
    
    //the functins below choose the correct text fields for the relevant Guest type
    func selectChildGuest() {
        enableDobField()
    }
    
    func selectAdultGuest() {
        disableAllFields()
    }
    
    func selectSeniorGuest() {
        enablePersonalFields()
    }
    
    func selectVipGuest() {
        disableAllFields()
    }
    
    func selectSeasonGuest() {
        enablePersonalFields()
        enableAddressFields()
    }
    
    //updates formatting when Employee is selected
    func selectEmployee() {
        initialEntrantType()
        initialSubType()
        selectNonContractEmployee()
        
        employeeButton.setTitleColor(obviousColor, for: .normal)
        
        subTypeOne.setTitle("Food", for: .normal)
        subTypeTwo.setTitle("Ride", for: .normal)
        subTypeThree.setTitle("Maintenance", for: .normal)
        subTypeFour.setTitle("Contract", for: .normal)
        subTypeFive.isHidden = true
    }
    
    //shows relevant text fields for a non contract employee
    func selectNonContractEmployee() {
        enableAllFields()
        disable(projectField, withLabel: projectLabel)
        disable(companyField, withLabel: companyLabel)
    }
    
    //shows relevant text fields for a contract employee
    func selectContractEmployee() {
        enableAllFields()
        disable(companyField, withLabel: companyLabel)
    }

    //update formtting when a Manager is selected
    func selectManager() {
        initialEntrantType()
        initialSubType()
        selectNonContractEmployee()
        
        managerButton.setTitleColor(obviousColor, for: .normal)
        
        subTypeOne.setTitle("Shift Mgr", for: .normal)
        subTypeTwo.setTitle("General Mgr", for: .normal)
        subTypeThree.setTitle("Senior Mgr", for: .normal)
        subTypeFour.isHidden = true
        subTypeFive.isHidden = true
    }
    
    //updates formatting when a vendor is selected
    func selectVendor() {
        initialEntrantType()
        initialSubType()
        enablePersonalFields()
        
        vendorButton.setTitleColor(obviousColor, for: .normal)
        
        subTypeOne.setTitle("Acme", for: .normal)
        subTypeTwo.setTitle("Orkin", for: .normal)
        subTypeThree.setTitle("Fedex", for: .normal)
        subTypeFour.setTitle("NW Electrical", for: .normal)
        subTypeFive.isHidden = true
        
        companyField.text = "Acme"
    }
    
    let exampleData = ExampleData()
    
    //automatically populates data using the data provided in the ExampleData class
    func populateData() {
        let originalCompanyName = companyField.text
        clearAllFields()
        if subTypeOne.titleLabel?.text == "Child"  && subTypeOne.titleColor(for: .normal) == obviousColorLight {
            let dob = exampleData.exampleChildDob
            guard let year = dob.year, let month  = dob.month, let day = dob.day else{fatalError()}
            dobField.text = "\(day)/\(month)/\(year)"}
        else {
            let data = exampleData.exampleAdult
            let projectNumber = exampleData.projectNumber
            let companyName = exampleData.companyName
            
            guard let firstName = data.firstName, let lastName = data.lastName, let streetAddress = data.streetAddress, let city = data.city, let state = data.state, let zipCode = data.zipCode, let ssn = data.socialSecurityNumber, let dob = data.dateOfBirth
                else{fatalError()}
            
            if dobField.isUserInteractionEnabled == true {
                guard let year = dob.year, let month  = dob.month, let day = dob.day else{fatalError()}
                dobField.text = "\(day)/\(month)/\(year)"}
            else  {dobField.text = "DD/MM/YYYY"}
            
            if ssnField.isUserInteractionEnabled == true {
                ssnField.text = ssn
            }
            else {ssnField.text = "###-##-####"}
            
            if projectField.isUserInteractionEnabled == true {
                projectField.text = projectNumber
            }
            else {projectField.text = "######"}
            
            if firstNameField.isUserInteractionEnabled == true {
                firstNameField.text = firstName
            }
            else {firstNameField.text = ""}
            
            if lastNameField.isUserInteractionEnabled == true {
                lastNameField.text = lastName
            }
            else {lastNameField.text = ""}
            
            if companyField.isUserInteractionEnabled == true {
                companyField.text = companyName
            }
            else {companyField.text = originalCompanyName}
            
            if streetAddressField.isUserInteractionEnabled == true {
                streetAddressField.text = streetAddress
            }
            else {streetAddressField.text = ""}
            
            if cityField.isUserInteractionEnabled == true {
                cityField.text = city
            }
            else {cityField.text = ""}
            
            if stateField.isUserInteractionEnabled == true {
                stateField.text = state
            }
            else {stateField.text = ""}
            
            if zipField.isUserInteractionEnabled == true {
                zipField.text = zipCode
            }
            else {zipField.text = ""}
        }
        
    }
    
    //converts text in DD/MM/YYYY format to Date Components
    func convertTextToDate(_ date: String) -> DateComponents{
        let day = Int(date.prefix(2))
        let month = Int(date.suffix(7).prefix(2))
        let year = Int(date.suffix(4))
        return DateComponents(year: year, month: month, day: day)
    }
    
    //converts the text in the date of birth field to date components
    func currentDob() -> DateComponents {
        guard let dob = dobField.text else {fatalError()}
        return convertTextToDate(dob)
    }
    
   // returns a struct containing the entrant information entered into the data fields
    func currentEntrantInformation() -> EntrantInformation {
        var entrantInformation = EntrantInformation()
        
        entrantInformation.socialSecurityNumber = ssnField.text
        entrantInformation.firstName = firstNameField.text
        entrantInformation.lastName = lastNameField.text
        entrantInformation.streetAddress = streetAddressField.text
        entrantInformation.city = cityField.text
        entrantInformation.state = stateField.text
        entrantInformation.zipCode = zipField.text
        entrantInformation.dateOfBirth = currentDob()
        
        return  entrantInformation
    }
    
    //returns the first name entered
    func currentFirstName() -> String {
        guard let name = firstNameField.text else {fatalError()}
        return name    }
    
     //returns the last name entered
    func currentLastName() -> String {
        guard let name = lastNameField.text else {fatalError()}
        return name    }
    
     //returns the project number entered
    func currentProjectNumber() -> String {
        guard let number = projectField.text else {fatalError()}
        return number    }
    
    //initialise the currentEntrant and currentPass variables
    var currentEntrant: Entrant = Entrant(entrantType: .guest)
    var currentPass: EntrantPass = Entrant(entrantType: .guest).generatePass()
    
    //create an instance of Guest or a subclass of Guest
    func createCurrentGuest()  {
        if subTypeOne.titleLabel?.text != "Child" {fatalError()}
        else{
            if subTypeOne.titleColor(for: .normal) == obviousColorLight {
                currentEntrant = FreeChildGuest(dateOfBirth: currentDob())}
            else if subTypeTwo.titleColor(for: .normal) == obviousColorLight {currentEntrant = Guest(guestType: .adult)}
            else if subTypeThree.titleColor(for: .normal) == obviousColorLight { currentEntrant = SeniorGuest(firstName: currentFirstName(), lastName: currentLastName(), dateOfBirth: currentDob())}
            else if subTypeFour.titleColor(for: .normal) == obviousColorLight { currentEntrant = Guest(guestType: .vip)}
            else if subTypeFive.titleColor(for: .normal) == obviousColorLight {currentEntrant = SeasonGuest(entrantInformation: currentEntrantInformation())}
            else {fatalError()}
        }
    }
    
     //create an instance of Employee or a subclass of Employee
    func createCurrentEmployee()  {
        if subTypeOne.titleLabel?.text != "Food" {fatalError()}
        else{
            if subTypeOne.titleColor(for: .normal) == obviousColorLight {currentEntrant = Employee(employeeType: .foodSerevicesHourly, entrantInformation: currentEntrantInformation())}
            else if subTypeTwo.titleColor(for: .normal) == obviousColorLight {currentEntrant = Employee(employeeType: .rideServicesHourly, entrantInformation: currentEntrantInformation())}
            else if subTypeThree.titleColor(for: .normal) == obviousColorLight { currentEntrant = Employee(employeeType: .maintenanceHourly, entrantInformation: currentEntrantInformation())}
            else if subTypeFour.titleColor(for: .normal) == obviousColorLight { currentEntrant = ContractEmployee(projectNumber: currentProjectNumber(), entrantInformation: currentEntrantInformation())}
            else {fatalError()}
        }
    }
    
    //create an instance of Manager or a subclass of Manager
    func createCurrentManager()  {
        if subTypeOne.titleLabel?.text != "Shift Mgr" {fatalError()}
        else{
            if subTypeOne.titleColor(for: .normal) == obviousColorLight {currentEntrant = Manager(position: .shiftManager, entrantInformation: currentEntrantInformation())}
            else if subTypeTwo.titleColor(for: .normal) == obviousColorLight {currentEntrant = Manager(position: .generalManager, entrantInformation: currentEntrantInformation())}
            else if subTypeThree.titleColor(for: .normal) == obviousColorLight { currentEntrant = Manager(position: .seniorManagegr, entrantInformation: currentEntrantInformation())}
            else {fatalError()}
        }
    }
    
    //create an instance of Vendor or a subclass of Vendor
    func createCurrentVendor() {
        if subTypeOne.titleLabel?.text != "Acme" {fatalError()}
        else{
            if subTypeOne.titleColor(for: .normal) == obviousColorLight {currentEntrant = Vendor(firstName: currentFirstName(), lastName: currentLastName(), dateOfBirth: currentDob(), vendorCompany: .acme)}
            else if subTypeTwo.titleColor(for: .normal) == obviousColorLight {
                currentEntrant = Vendor(firstName: currentFirstName(), lastName: currentLastName(), dateOfBirth: currentDob(), vendorCompany: .orkin)}
            else if subTypeThree.titleColor(for: .normal) == obviousColorLight {currentEntrant = Vendor(firstName: currentFirstName(), lastName: currentLastName(), dateOfBirth: currentDob(), vendorCompany: .fedex)}
            else if subTypeFour.titleColor(for: .normal) == obviousColorLight { currentEntrant = Vendor(firstName: currentFirstName(), lastName: currentLastName(), dateOfBirth: currentDob(), vendorCompany: .nkElectrical)}
            else {fatalError()}
        }
        
    }
    
    //create an instance of a subclass of Entrant
    func createCurrentEntrant()
    {
        if guestButton.titleColor(for: .normal) == obviousColor {
            createCurrentGuest()}
        else if employeeButton.titleColor(for: .normal) == obviousColor{ createCurrentEmployee()}
        else if managerButton.titleColor(for: .normal) == obviousColor  { createCurrentManager()}
        else if vendorButton.titleColor(for: .normal) == obviousColor { createCurrentVendor()}
        else {fatalError()}
        
    }
    
    //check whether a particular field is complete given that it is enabled
    func isDataComplete(in field: UITextField) -> Bool  {
        if field.isUserInteractionEnabled == true && (field.text == "" || field.text == "DD/MM/YYYY" || field.text ==
            "###-##-####" || field.text ==
             "######") { return false}
        return true
    }
    
    
        //check whether all enabled fields are complete
    func  checkAllRequiredDataIsComplete() throws  {
         guard isDataComplete (in: firstNameField)  else {throw EntrantInformationError.firstNameMissing }
         guard isDataComplete (in: lastNameField)  else {throw EntrantInformationError.lastNameMissing }
         guard isDataComplete (in: cityField)  else {throw EntrantInformationError.cityMissing }
         guard isDataComplete (in: zipField)  else {throw EntrantInformationError.zipCodeMissing }
         guard isDataComplete (in: streetAddressField)  else {throw EntrantInformationError.streetAddressMissing }
         guard isDataComplete (in: stateField)  else {throw EntrantInformationError.stateMissing }
         guard isDataComplete (in: ssnField)  else {throw EntrantInformationError.socialSecurityNumberMissing }
         guard isDataComplete (in: dobField)  else {throw EntrantInformationError.dateOfBirthMissing }
         guard isDataComplete (in: projectField)  else {throw EntrantInformationError.projectNumberMissing }
         guard isDataComplete (in: companyField)  else {throw EntrantInformationError.companyMissing }
        
        }
    
    //show alert message if infrormation is incomplete
    
    func generateAlertForMisingData() {
        // create the alert
        let alert = UIAlertController(title: "Data incomplete", message: "Please complete all highlighted data fields.", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    

    
   //ACTIONS
    
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
    
    @IBAction func chooseSubTypeOne(_ sender: Any) {
        showAllSubTypesAsSubtle()
        subTypeOne.setTitleColor(obviousColorLight, for: .normal)
    
        clearAllFields()
        disableAllFields()
        
       switch subTypeOne.titleLabel?.text {
        case "Child": do {self.selectChildGuest()}
        case "Food", "Shift Mgr": do {self.selectNonContractEmployee()}
        case "Acme": do {enablePersonalFields()
            companyField.text = "Acme"
        }
        default: do {}
        }
        
    }
    
    @IBAction func chooseSubTypeTwo(_ sender: Any) {
        showAllSubTypesAsSubtle()
        subTypeTwo.setTitleColor(obviousColorLight, for: .normal)
      
        clearAllFields()
        disableAllFields()
        
        switch subTypeTwo.titleLabel?.text {
        case "Adult": do {self.selectAdultGuest()}
        case "Ride", "General Mgr": do {self.selectNonContractEmployee()}
        case "Orkin": do {enablePersonalFields()
            companyField.text = "Orkin"
            }
        default: do {}
        }
    }
    
    
    @IBAction func chooseSubTypeThree(_ sender: Any) {
        showAllSubTypesAsSubtle()
        subTypeThree.setTitleColor(obviousColorLight, for: .normal)
       
        clearAllFields()
        disableAllFields()
        
        switch subTypeThree.titleLabel?.text {
        case "Senior": do {self.selectSeniorGuest()}
        case "Maintenance", "Senior Mgr": do {self.selectNonContractEmployee()}
        case "Fedex": do {enablePersonalFields()
            companyField.text = "Fedex"
            }
        default: do {}
        }
    }
    
    
    @IBAction func chooseSybTypeFour(_ sender: Any) {
        showAllSubTypesAsSubtle()
        subTypeFour.setTitleColor(obviousColorLight, for: .normal)
        
        clearAllFields()
        disableAllFields()
        
        switch subTypeFour.titleLabel?.text {
        case "VIP": do {self.selectVipGuest()}
        case "Contract": do {self.selectContractEmployee()}
        case "NW Electrical": do {enablePersonalFields()
            companyField.text = "NW Electrical"
            }
        default: do {}
        }
        
    }
    
    
    @IBAction func chooseSubTypeFive(_ sender: Any) {
        showAllSubTypesAsSubtle()
        subTypeFive.setTitleColor(obviousColorLight, for: .normal)
        
        clearAllFields()
        disableAllFields()
        
        switch subTypeFive.titleLabel?.text {
        case "Season Pass": do {self.selectSeasonGuest()}
        default: do {}
        }
    }
    
    

    
    @IBAction func populateData(_ sender: Any) {
        populateData()
    }
    
    
    @IBAction func checkData(_ sender: Any) {
        do {try checkAllRequiredDataIsComplete()
            checkDataButton.isHidden = true
            populateDataButton.isHidden = true
            generatePassButton.isHidden = false
            disableAllFields()
        } catch {print( "information incomplete")
            generateAlertForMisingData()}

    }
    
    
    @IBAction func generatePass(_ sender: Any) {
       
        createCurrentEntrant()
        currentPass = currentEntrant.generatePass()
    
        performSegue(withIdentifier: "send", sender: self)
            
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.finalPass = self.currentPass
        vc.finalEntrant = self.currentEntrant
    }
    
}
    

    






