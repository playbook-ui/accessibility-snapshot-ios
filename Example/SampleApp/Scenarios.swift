import Playbook
import SwiftUI

public struct AllScenarios: ScenarioProvider {
    public static func addScenarios(into playbook: Playbook) {
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

            Scenario("ScrollView", layout: .fill) {
                ScrollView {
                    TextExample()
                }
            }
        }
    }

    public init() {}
}
