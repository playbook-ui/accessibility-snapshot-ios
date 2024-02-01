TOOL = PLAYBOOK_DEVELOPMENT=1 swift run -c release
GITHUB_RAW_CONTENT_PATH = https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/
GITHUB_TREE_PATH = https://github.com/playbook-ui/accessibility-snapshot-ios/main/

.PHONY: proj
proj:
	$(TOOL) xcodegen --spec Example/project.yml --project Example

.PHONY: format
format:
	$(TOOL) swift-format format -i -p -r Sources Example/SampleAccessibilitySnapshot

.PHONY: lint
lint:
	$(TOOL) swift-format lint -s -p -r Sources Example/SampleAccessibilitySnapshot

.PHONY: npm
npm:
	npm i

.PHONY: fix-readme-links
fix-readme-links:
	sed -i '' -E '/.?http/!s#(<img src=")([^"]+)#\1$(GITHUB_RAW_CONTENT_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<img .+src=")([^"]+)#\1$(GITHUB_RAW_CONTENT_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<a href=")([^"]+)#\1$(GITHUB_TREE_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<a .+href=")([^"]+)#\1$(GITHUB_TREE_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(\!\[.+\])\((.+)\)#\1($(GITHUB_RAW_CONTENT_PATH)\2)#g' README.md
	sed -i '' -E '/.?http/!s#(\[.+\])\((.+)\)#\1($(GITHUB_TREE_PATH)\2)#g' README.md
