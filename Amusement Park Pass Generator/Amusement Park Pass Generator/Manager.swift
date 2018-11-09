//define subcategories of Manager
enum ManagementTier {
    case shiftManager
    case generalManager
    case seniorManagegr
}

//define Manager, a subclass of Employee
//add manager specific information such as discount level and management tier
class Manager: Employee {
    let position: ManagementTier
    
    init(entrantType: EntrantType, employeeType: EmployeeType, entrantInformation: EntrantInformation,managementTier: ManagementTier) {
        self.position = managementTier
        super.init(entrantType: entrantType, employeeType: employeeType, entrantInformation: entrantInformation)
    }
    
    override func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.25, discountOnMerchandise: 0.25)
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: position)
    }
}

