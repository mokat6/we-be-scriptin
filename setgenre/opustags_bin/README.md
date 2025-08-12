# opustags by fmang

https://github.com/fmang/opustags

---

if you can't build yourself. This is a binary built on WSL ubuntu x86 Intel CPU.

The binary depends on

```bash
ldd ./opustags
  linux-vdso.so.1 (0x00007fffaebc4000)
  libogg.so.0 => /lib/x86_64-linux-gnu/libogg.so.0 (0x00007c8a48535000)
  libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007c8a48200000)
  libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007c8a48515000)
  libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007c8a47e00000)
  libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007c8a4842e000)
  /lib64/ld-linux-x86-64.so.2 (0x00007c8a4857d000)
```

- libogg.so.0 — Ogg bitstream library
- libstdc++.so.6 — C++ standard library
- libgcc_s.so.1 — GCC runtime support library
- libc.so.6 — Standard C library
- libm.so.6 — Math library

If you don't have them in the system, it wont work. But most are standard libraries
`libogg` might be less common but is also usually available or easy to install (`libogg0` package on Debian/Ubuntu).

- libogg 1.3.3
  is also needed when building from src
