NAME = gemini
BIN = $(NAME).filter.dpi
DILLO_DIR = ~/.dillo
CSS = style.css
DPI_DIR = $(DILLO_DIR)/dpi/$(NAME)
DPIDRC = $(DILLO_DIR)/dpidrc

all:
	@echo "Use 'make install' to install"
	@echo "Use 'make uninstall' to uninstall"

$(DPIDRC):
	mkdir -p $(DPI_DIR)
	if [ -f /etc/dillo/dpidrc ]; then cp /etc/dillo/dpidrc $@; \
	elif [ -f /usr/local/etc/dillo/dpidrc ]; then cp /usr/local/etc/dillo/dpidrc $@; \
	else echo "Can't find dpidrc, is dillo installed?"; false; fi

install-proto: $(DPIDRC)
	grep -q '^proto.$(NAME)=$(NAME)' $< || echo 'proto.$(NAME)=$(NAME)/$(BIN)' >> $<
	dpidc stop || true

link: $(BIN) install-proto
	mkdir -p $(DPI_DIR)
	ln -frs $(BIN) $(DPI_DIR)
	ln -frs $(CSS) $(DPI_DIR)

install: $(BIN) install-proto
	mkdir -p $(DPI_DIR)
	cp -f $(BIN) $(DPI_DIR)
	cp -f $(CSS) $(DPI_DIR)

uninstall: $(BIN)
	rm -f $(DPI_DIR)/$(BIN)
	rm -f $(DPI_DIR)/$(CSS)

.PHONY:
	all install install-proto uninstall
