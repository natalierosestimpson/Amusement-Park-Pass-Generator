

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var entrantName: UILabel!
    @IBOutlet weak var entrantType: UILabel!
    @IBOutlet weak var accessSummary: UILabel!
    @IBOutlet weak var foodDiscount: UILabel!
    @IBOutlet weak var merchDiscount: UILabel!
    @IBOutlet weak var testResults: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        entrantName.text = swipe.fullName(from: finalPass)
        entrantType.text = finalEntrant.type()
        accessSummary.text = swipe.checkAccessToAllRides(for: finalPass)
        foodDiscount.text = swipe.checkDiscountOnFood(for: finalPass)
        merchDiscount.text = swipe.checkDiscountOnMerchandise(for: finalPass)
        
    }
    
    var finalPass: EntrantPass = Entrant(entrantType: .guest).generatePass()
    
    var finalEntrant: Entrant = Entrant(entrantType: .guest)
    
    let swipe = SwipeMethods()
    
    
    
    @IBAction func testAreaAccess(_ sender: Any) {
        testResults.text = "\(swipe.checkAccessToAmusementAreas(for: finalPass))\n\(swipe.checkAccessToKitchenAreas(for: finalPass))\n\(swipe.checkAccessToMaintenanceAreas(for: finalPass))\n\(swipe.checkAccessToRideControlAreas(for: finalPass))\n\(swipe.checkAccessToOfficeAreas(for: finalPass))  "
    }
    
    @IBAction func testRideAccess(_ sender: Any) {
        testResults.text = "\(swipe.checkAccessToAllRides(for: finalPass))\n\(swipe.checkAccessToSkipRideLines(for: finalPass)) "
    }
    
    @IBAction func testDiscountAccess(_ sender: Any) {
        testResults.text = "\(swipe.checkDiscountOnFood(for: finalPass))\n\(swipe.checkDiscountOnMerchandise(for: finalPass)) "
    }
    
    
    @IBAction func createNewPass(_ sender: Any) {
    }
    
}
