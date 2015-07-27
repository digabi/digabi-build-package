all:

install:
	install -D -m 0755 digabi-build-package.sh $(DESTDIR)/usr/bin/dbp
	install -D -m 0755 tools/build.sh $(DESTDIR)/usr/lib/digabi-build-package/tools/build.sh
	install -D -m 0755 tools/source.sh $(DESTDIR)/usr/lib/digabi-build-package/tools/source.sh
	install -D -m 0755 tools/artifacts.sh $(DESTDIR)/usr/lib/digabi-build-package/tools/artifacts.sh
	install -D -m 0644 config.default $(DESTDIR)/usr/lib/digabi-build-package/dbp.conf
	
	install -D -m 0644 Vagrantfile $(DESTDIR)/usr/lib/digabi-build-package/Vagrantfile
	sed -i 's,\./tools,/usr/lib/digabi-build-package/tools,g' $(DESTDIR)/usr/lib/digabi-build-package/Vagrantfile
