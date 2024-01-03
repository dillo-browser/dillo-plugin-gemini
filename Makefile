NAME = gemini
BIN = $(NAME).filter.dpi
DILLO_DIR = ~/.dillo
DPI_DIR = $(DILLO_DIR)/dpi/$(NAME)
DPIDRC = $(DILLO_DIR)/dpidrc

all:
	@echo "Use 'make install' to install"
	@echo "Use 'make uninstall' to uninstall"

$(DPIDRC):
	cp /etc/dillo/dpidrc $@

install-proto: $(DPIDRC)
	grep -q '^proto.$(NAME)=$(NAME)' $< || echo 'proto.$(NAME)=$(NAME)/$(BIN)' >> $<
	dpidc stop || true

link: $(BIN) install-proto
	mkdir -p $(DPI_DIR)
	ln -frs $(BIN) $(DPI_DIR)

install: $(BIN) install-proto
	mkdir -p $(DPI_DIR)
	cp -f $(BIN) $(DPI_DIR)

uninstall: $(BIN)
	rm -f $(DPI_DIR)/$(BIN)

.PHONY:
	all install install-proto uninstall
