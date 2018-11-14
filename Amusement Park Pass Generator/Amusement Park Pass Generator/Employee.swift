enum EmployeeType {
    case foodSerevicesHourly
    case rideServicesHourly
    case maintenanceHourly
    case contract
}

//define Employee, a subclass of Entrant
//define the particular access settings that apply to Employee
//define function to validate information provided for the Employee
//define function to include specific Employee information in an Employee pass

class Employee: Entrant {
    var employeeType: EmployeeType
    var entrantInformation: EntrantInformation
    
    init(employeeType: EmployeeType, entrantInformation: EntrantInformation) {
        self.employeeType = employeeType
        self.entrantInformation = entrantInformation
        super.init(entrantType: .employee)
        
    }
    
    override func areaAccess () -> AreaAccess {
        switch employeeType {
        case .foodSerevicesHourly: return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
        case .rideServicesHourly: return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
        case .maintenanceHourly: return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: true, officeAreas: false)
        case .contract: return AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
          
        }
    }
    
    override func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.15, discountOnMerchandise: 0.25)
    }
    
    func checkEntrantInformation() throws  {
        guard entrantInformation.firstName != nil else{throw EntrantInformationError.firstNameMissing }
        guard entrantInformation.lastName != nil else{throw EntrantInformationError.lastNameMissing }
        guard entrantInformation.city != nil else{throw EntrantInformationError.cityMissing }
        guard entrantInformation.zipCode != nil else{throw EntrantInformationError.zipCodeMissing }
        guard entrantInformation.streetAddress != nil else{throw EntrantInformationError.streetAddressMissing }
        guard entrantInformation.state != nil else{throw EntrantInformationError.stateMissing }
        guard entrantInformation.socialSecurityNumber != nil else{throw EntrantInformationError.socialSecurityNumberMissing }
        guard entrantInformation.dateOfBirth != nil else{throw EntrantInformationError.dateOfBirthMissing }
        
        
    }
    
    override func validateEntrantInformation()  {
        do {try checkEntrantInformation()}
        catch{print( "information incomplete")}
        print("information complete")
    }
    
    
    override func generatePass()-> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: nil, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
    }
}
