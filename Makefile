VERSION = 1.01
PN = governor-switcher

INITDIR_SYSTEMD = /usr/lib/systemd/system
HOTTIMER_DIR = $(INITDIR_SYSTEMD)/timers.target.wants

INSTALL = install -p
SYMLINK = ln -s
INSTALL_PROGRAM = $(INSTALL) -m755
INSTALL_DATA = $(INSTALL) -m644
INSTALL_DIR = $(INSTALL) -d


RM = rm
Q = @

all:
	/bin/true

install-systemd:
	$(INSTALL_DIR) "$(DESTDIR)/$(HOTTIMER_DIR)"
	$(INSTALL_DATA) init/governor-switcher-ondemand.service "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-ondemand.service"
	$(INSTALL_DATA) init/governor-switcher-ondemand.timer "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-ondemand.timer"
	$(INSTALL_DATA) init/governor-switcher-performance.service "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-performance.service"
	$(INSTALL_DATA) init/governor-switcher-performance.timer "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-performance.timer"
	$(SYMLINK) ../governor-switcher-ondemand.timer "$(DESTDIR)$(HOTTIMER_DIR)/governor-switcher-ondemand.timer"
	$(SYMLINK) ../governor-switcher-performance.timer "$(DESTDIR)$(HOTTIMER_DIR)/governor-switcher-performance.timer"

install: install-systemd

uninstall:
	$(Q)$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-ondemand.service"
	$(Q)$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-ondemand.timer"
	$(Q)$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-performance.service"
	$(Q)$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/governor-switcher-performance.timer"
	$(Q)$(RM) "$(DESTDIR)$(HOTTIMER_DIR)/governor-switcher-ondemand.timer"
	$(Q)$(RM) "$(DESTDIR)$(HOTTIMER_DIR)/governor-switcher-performance.timer"

.PHONY: uninstall install install-systemd
