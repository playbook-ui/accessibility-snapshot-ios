SWIFT_RUN := swift run -c release
GITHUB_RAW_CONTENT_PATH := https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/
GITHUB_TREE_PATH := https://github.com/playbook-ui/accessibility-snapshot-ios/main/

.PHONY: all
all: proj format

.PHONY: proj
proj:
	$(SWIFT_RUN) --package-path Tools xcodegen --spec Example/project.yml --project Example

.PHONY: format
format:
	$(SWIFT_RUN) --package-path Tools swift-format -i -r -m format Sources Example/SampleAccessibilitySnapshot

.PHONY: lint
lint:
	$(SWIFT_RUN) --package-path Tools swift-format -r -m lint Sources Example/SampleAccessibilitySnapshot

.PHONY: npm
npm:
	npm i

.PHONY: docs
docs:
	$(SWIFT_RUN) --package-path Tools/Doc swift-doc generate Sources -n PlaybookAccessibilitySnapshot -f html -o docs --base-url https://playbook-ui.github.io/accessibility-snapshot-ios

.PHONY: fix-readme-links
fix-readme-links:
	sed -i '' -E '/.?http/!s#(<img src=")([^"]+)#\1$(GITHUB_RAW_CONTENT_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<img .+src=")([^"]+)#\1$(GITHUB_RAW_CONTENT_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<a href=")([^"]+)#\1$(GITHUB_TREE_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<a .+href=")([^"]+)#\1$(GITHUB_TREE_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(\!\[.+\])\((.+)\)#\1($(GITHUB_RAW_CONTENT_PATH)\2)#g' README.md
	sed -i '' -E '/.?http/!s#(\[.+\])\((.+)\)#\1($(GITHUB_TREE_PATH)\2)#g' README.md
