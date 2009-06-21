YUI=~/bin/yuicompressor-2.4.2.jar

MINIFY_OTPIONS=	 --preserve-semi --line-break 80

all: org-info.js


minify-info: org-info-src.js sed.txt
	sed -f sed.txt org-info-src.js > org-info-tmp.js
	java -jar $(YUI) $(MINIFY_OTPIONS) org-info-tmp.js > org-info.js


org-info.js: org-info-src.js
	java -jar $(YUI) $(MINIFY_OTPIONS) org-info-src.js > org-info.js
