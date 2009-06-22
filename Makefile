YUI=~/bin/yuicompressor-2.4.2.jar

MINIFY_OTPIONS=	 --preserve-semi --line-break 80

all: choose


minify: org-info-src.js sed.txt
	sed -f sed.txt org-info-src.js > org-info-tmp.js
	java -jar $(YUI) $(MINIFY_OTPIONS) org-info-tmp.js > org-info.js


org-info.js: org-info-src.js
	java -jar $(YUI) $(MINIFY_OTPIONS) org-info-src.js > org-info.js

choose:
	@echo "Possible Makefile targets:"
	@echo
	@echo "  make org-info.js"
	@echo
	@echo "           Keep the original names for object properties."
	@echo "           Install java, download a current version of Yahoos"
	@echo "           yuicompressor and adjust the first line of this"
	@echo "           Makefile."
	@echo
	@echo "  make minify"
	@echo
	@echo "           Create a minified version (about 10 Kb smaller)."
	@echo "           Recommended."
