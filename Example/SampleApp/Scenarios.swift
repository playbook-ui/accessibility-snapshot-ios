import Playbook
import SwiftUI

struct AllScenarios: ScenarioProvider {
    static func addScenarios(into playbook: Playbook) {
        playbook.addScenarios(of: "Accessibility") {
            Scenario("Standard Controls", layout: .fill) {
                StandardControlExample()
            }
            
            Scenario("Images", layout: .fill) {
                ImageExample()
            }
            
            Scenario("Text", layout: .fill) {
                TextExample()
            }
            
            Scenario("Containers", layout: .fill) {
                ContainerExample()
            }
            
            Scenario("Actions", layout: .fill) {
                ActionExample()
            }
            
            Scenario("ViewRepresentable", layout: .fill) {
                RepresentableExample()
            }
        }
    }
}
