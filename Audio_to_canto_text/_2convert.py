import re
import subprocess
import sys
import os

def srt_to_lrc(srt_content):
    output = []
    blocks = srt_content.strip().split("\n\n")

    for block in blocks:
        lines = block.strip().split("\n")
        if len(lines) < 2:
            continue
        timestamp = lines[1].split(" --> ")[0]
        h, m, s_ms = timestamp.split(":")
        s, ms = s_ms.split(",")
        lrc_time = f"[{int(h)*60 + int(m):02d}:{int(s):02d}.{int(ms)//10:02d}]"
        text = " ".join(lines[2:])
        output.append(f"{lrc_time} {text}")

    return "\n".join(output)

# ✅ Handle CLI argument
if len(sys.argv) < 2:
    print("Usage: python3 srt_to_lrc.py inputName.srt")
    sys.exit(1)

input_file = sys.argv[1]
if not os.path.isfile(input_file):
    print(f"Error: File not found -> {input_file}")
    sys.exit(1)

output_file = os.path.splitext(input_file)[0] + ".lrc"

# Step 1: Read SRT file
with open(input_file, encoding="utf-8") as f:
    srt_data = f.read()

# Step 2: Convert to LRC
lrc_data = srt_to_lrc(srt_data)

# Step 3: Pipe into Node.js script

    # Get the directory of this Python script
script_dir = os.path.dirname(os.path.realpath(__file__))

    # Absolute path to _trasim.js
trasim_path = os.path.join(script_dir, "_trasim.js")


try:
    result = subprocess.run(
        ["node", trasim_path],
        input=lrc_data,
        capture_output=True,
        text=True,
        check=True
    )
    simplified_lrc = result.stdout
except subprocess.CalledProcessError as e:
    print(f"Error running Node.js: {e.stderr}")
    sys.exit(1)

# Step 4: Write to output file
with open(output_file, "w", encoding="utf-8") as f:
    f.write(simplified_lrc)

print(f"✅ Done: {output_file} created.")
