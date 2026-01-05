#!/usr/bin/env python3
import argparse
import re
from pathlib import Path

WITH_OPACITY_RE = re.compile(
    r"\.withOpacity\(\s*(?P<num>(?:0?\.\d+|1(?:\.0+)?|0(?:\.0+)?))\s*\)"
)

def opacity_to_alpha(num_str: str) -> int:
    val = float(num_str)
    val = max(0.0, min(1.0, val))
    return int(round(val * 255))

def convert_text(text: str):
    changed = False

    def repl(m: re.Match) -> str:
        nonlocal changed
        alpha = opacity_to_alpha(m.group("num"))
        changed = True
        return f".withAlpha({alpha})"

    new_text = WITH_OPACITY_RE.sub(repl, text)
    return new_text, changed

def iter_dart_files(paths):
    for p in paths:
        p = Path(p)
        if p.is_file() and p.suffix == ".dart":
            yield p
        elif p.is_dir():
            for f in p.rglob("*.dart"):
                if ".dart_tool" in f.parts or "build" in f.parts:
                    continue
                yield f

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("paths", nargs="*", default=["lib"])
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    changed_files = 0

    for file_path in iter_dart_files(args.paths):
        try:
            original = file_path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue

        updated, changed = convert_text(original)
        if not changed:
            continue

        changed_files += 1

        if args.dry_run:
            print(f"[DRY] {file_path}")
        else:
            file_path.write_text(updated, encoding="utf-8")
            print(f"[FIX] {file_path}")

    print(f"\nDone. Changed {changed_files} files.")

if __name__ == "__main__":
    main()
