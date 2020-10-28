import Playbook
import SwiftUI

struct AllScenarios: ScenarioProvider {
    static func addScenarios(into playbook: Playbook) {
        playbook.addScenarios(of: "Content") {
            Scenario("ContentView", layout: .fill) {
                ContentView()
            }
        }
    }
}
