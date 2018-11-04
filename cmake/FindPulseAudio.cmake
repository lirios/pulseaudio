find_package(PkgConfig)

pkg_check_modules(PulseAudio "libpulse libpulse-mainloop-glib" REQUIRED IMPORTED_TARGET)
