import UIKit

// ***********TEST AREA***********
 
 let swipeMethods = SwipeMethods()
 
 let defaultDave = Entrant(entrantType: .employee)
 let defaultDavePass = defaultDave.generatePass()
 let canDefaultDaveSkipRideLines = swipeMethods.checkAccessToSkipRideLines(for: defaultDavePass)
 
 let classicClaire = Guest(entrantType: .guest, guestType: .classic)
 let classicClairePass = classicClaire.generatePass()
 let doesClassicClaireHaceAccessToKitchenAreas = swipeMethods.checkAccessToKitchenAreas(for: classicClairePass)
 
 let maintenanceMikeInfo = EntrantInformation(firstName: "Mike", lastName: "Smith", streetAddress: "10 Oxford street", city: "London", state: "UK", zipCode: "W1U 1DQ", socialSecurityNumber: "123456", dateOfBirth: DateComponents(year: 1990, month: 6, day: 30))
 let maintenanceMike = Employee(entrantType: .employee, employeeType: .maintenanceHourly, entrantInformation: maintenanceMikeInfo)
 let validateMikeinfo = maintenanceMike.validateEntrantInformation()
 let maintenanceMikePass = maintenanceMike.generatePass()
 let doesMikeHaveADiscountOnMerc = swipeMethods.checkDiscountOnMerchandise(for: maintenanceMikePass)
 
 let managerMichelleInfo = EntrantInformation(firstName: "Michelle", lastName: "Jones", streetAddress: "50 Long Lane", city: "Birmingham", state: "UK", zipCode: "B1 8PQ", socialSecurityNumber: "987654", dateOfBirth: DateComponents(year:1985, month:9, day:6))
 let managerMichelle = Manager(entrantType: .employee, employeeType: .manager, entrantInformation: managerMichelleInfo, managementTier: ManagementTier.generalManager)
 let validateMichelleinfo = managerMichelle.validateEntrantInformation()
 let managerMichellePass = managerMichelle.generatePass()
 let doesMichelleHaveAccessToOfficeAreas = swipeMethods.checkAccessToOfficeAreas(for: managerMichellePass)
 
 
 let incorrectIanInfo = EntrantInformation(firstName: "Ian", lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: nil)
 let incorrectIan = Employee(entrantType: .employee, employeeType: .foodSerevicesHourly, entrantInformation: incorrectIanInfo)
 let checkIanInfo = try? incorrectIan.checkEntrantInformation()
 
 
 


