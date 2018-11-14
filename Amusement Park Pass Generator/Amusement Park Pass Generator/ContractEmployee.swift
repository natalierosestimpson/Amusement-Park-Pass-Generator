
//define Employee, a subclass of Entrant
//define the particular access settings that apply to Employee
//define function to validate information provided for the Employee
//define function to include specific Employee information in an Employee pass

class ContractEmployee: Employee {
    var projectNumber: String
    
    init(projectNumber:String, entrantInformation: EntrantInformation) {
        self.projectNumber = projectNumber
        super.init(employeeType: .contract, entrantInformation: entrantInformation)
        self.entrantInformation = entrantInformation
    }
    
    override func areaAccess () -> AreaAccess {
        switch projectNumber {
        case "1001": return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
        case "1002": return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintenanceAreas: true, officeAreas: false)
        case "1003": return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
        case "2001": return AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: true)
        case "2002": return AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: true, maintenanceAreas: true, officeAreas: false)
        default: fatalError()
        }
    }
    
    override func rideAccess() -> RideAccess {
        return RideAccess(accessAllRides: false, skipAllRideLines: false)
    }
    
    override func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.0, discountOnMerchandise: 0.0)
    }
    
    override func generatePass()-> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: nil, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: projectNumber)
    }
}

