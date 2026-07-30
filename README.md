# Compact CachyOS Conky Dashboard

A vertically compact, Catppuccin Mocha-themed Conky system monitor for **CachyOS** (or any Arch-based distro). Fits in the top-right corner with a **2-line-per-section** layout — labels and stats on line 1, progress bar on line 2.

![Screenshot](screenshot.png)

## Features

| Section | Displays |
|---|---|
| **Header** | Distro name, kernel version, uptime |
| **CPU** | Total + per-core utilization (4 cores), bar |
| **RAM + ZRAM** | Memory used/percent, ZRAM size + compression ratio, bar |
| **GPU** | GPU utilization bar, VRAM usage, power draw (NVIDIA) |
| **DISK** | Root partition usage, bar |
| **NET** | Download/upload speeds + totals, sparkline graphs |
| **Temps** | CPU / GPU / SSD temperatures |
| **Processes** | Top 3 processes by CPU, process count, CPU frequency |

## Requirements

- **Conky** 1.10+ (`conky-lua` or `conky-nvidia` on CachyOS/Arch)
- **NVIDIA GPU** with `nvidia-smi` (for GPU section)
- **lm-sensors** (for CPU/SSD temps) — `sensors` must detect `coretemp-isa-0000` and `nvme-pci-0200`
- **bc** and **coreutils** (for ZRAM stats script)

Install dependencies on CachyOS/Arch:

```bash
sudo pacman -S conky-lua-nvidia lm_sensors bc
```

## Installation

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/compact-cachyos-conky.git
cd compact-cachyos-conky

# Install config
cp conky.conf ~/.config/conky/conky.conf

# Install helper scripts
cp gpu-util ~/.local/bin/
cp zram-stats ~/.local/bin/
chmod +x ~/.local/bin/gpu-util ~/.local/bin/zram-stats

# Start conky
conky -c ~/.config/conky/conky.conf -d

# Auto-start on login (KDE/Plasma):
# Add "conky -c ~/.config/conky/conky.conf -d" to Autostart
```

## Customization

- **Widget width** — edit `minimum_width` / `maximum_width` in `conky.conf`.
- **Colors** — Catppuccin Mocha palette is defined in the config's color variables.
- **Network interface** — replace `wlan0` with your interface (e.g. `eth0`, `wlp2s0`).
- **GPU** — the `gpu-util` script and all `nvidia-smi` calls assume an NVIDIA GPU. For AMD/Intel, replace with `amdgpu` or `intel-gpu-tools` equivalents.
- **Temperatures** — sensor paths may differ by hardware. Run `sensors` to find your labels.

## Layout

```
CACHYOS 7.1.5-1-cachyos                  1h 32m
Load: 0.34 0.84 1.25

CPU 3%          C0:6% C1:4% C2:3% C3:3%
████████░░░░░░░░░░░░░░

RAM 35% 5.48GiB           ZRAM: 15.5G idle
██████████░░░░░░░░░░░░

GPU 0% · VRAM: 8/4096 MiB · PWR: 1.68 W
░░░░░░░░░░░░░░░░░░░░░░

DISK 62%                        173GiB/277GiB
████████████████████░░

NET   D: 1.5K (72.4MiB)   U: 1.4K (99.0MiB)
[graph] [graph]

CPU:53°C  GPU:44°C  SSD:39°C

opencode        12%   8%
kwin_wayland     5%   3%
floorp           3%   2%
Procs: 318                    4.30 GHz
```

## License

MIT
