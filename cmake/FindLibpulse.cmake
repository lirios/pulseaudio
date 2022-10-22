find_package(PkgConfig)

pkg_check_modules(Libpulse "libpulse libpulse-mainloop-glib" REQUIRED IMPORTED_TARGET)
